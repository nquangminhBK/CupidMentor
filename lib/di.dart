import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cupid_mentor/core/constants/gemini_api_key.dart';
import 'package:cupid_mentor/core/core_use_cases/generate_ai_content.dart';
import 'package:cupid_mentor/features/auth/data/data_sources/authentication_local_datasource.dart';
import 'package:cupid_mentor/features/auth/data/data_sources/authentication_remote_datasource.dart';
import 'package:cupid_mentor/features/auth/data/repositories/authentication_repository.dart';
import 'package:cupid_mentor/features/auth/domain/repositories/authentication_repository.dart';
import 'package:cupid_mentor/features/auth/domain/use_cases/signin.dart';
import 'package:cupid_mentor/features/auth/domain/use_cases/signout.dart';
import 'package:cupid_mentor/features/localization/data/data_sources/localization_datasource.dart';
import 'package:cupid_mentor/features/localization/data/repository/localization_repository.dart';
import 'package:cupid_mentor/features/localization/domain/repository/localization_repository.dart';
import 'package:cupid_mentor/features/localization/domain/use_cases/clear_language_data.dart';
import 'package:cupid_mentor/features/localization/domain/use_cases/get_language.dart';
import 'package:cupid_mentor/features/localization/domain/use_cases/set_language.dart';
import 'package:cupid_mentor/features/onboarding/data/data_sources/onboarding_datasource.dart';
import 'package:cupid_mentor/features/onboarding/data/repository/onboarding_repository.dart';
import 'package:cupid_mentor/features/onboarding/domain/repository/onboarding_repository.dart';
import 'package:cupid_mentor/features/onboarding/domain/use_cases/get_current_user.dart';
import 'package:cupid_mentor/features/onboarding/domain/use_cases/save_user_info.dart';
import 'package:cupid_mentor/features/setting/domain/use_cases/get_user_info.dart';
import 'package:cupid_mentor/features/splash_screen/data/data_sources/splash_datasource.dart';
import 'package:cupid_mentor/features/splash_screen/data/repositories/splash_repositories.dart';
import 'package:cupid_mentor/features/splash_screen/domain/repositories/splash_repositories.dart';
import 'package:cupid_mentor/features/splash_screen/domain/use_cases/check_is_logged_in.dart';
import 'package:cupid_mentor/features/splash_screen/domain/use_cases/check_need_onboarding.dart';
import 'package:cupid_mentor/features/splash_screen/domain/use_cases/check_need_showcase.dart';
import 'package:cupid_mentor/features/tip_date_spots/data/data_sources/tips_date_spot_datasource.dart';
import 'package:cupid_mentor/features/tip_date_spots/data/repository/tip_date_spot_repository.dart';
import 'package:cupid_mentor/features/tip_date_spots/domain/repository/tip_date_spot_repository.dart';
import 'package:cupid_mentor/features/tip_date_spots/domain/use_cases/add_tips_date_spot.dart';
import 'package:cupid_mentor/features/tip_date_spots/domain/use_cases/get_tips_date_spot.dart';
import 'package:cupid_mentor/features/tips_gift/data/data_sources/tips_gift_datasource.dart';
import 'package:cupid_mentor/features/tips_gift/data/repository/tips_gift_repository.dart';
import 'package:cupid_mentor/features/tips_gift/domain/repository/tips_gift_repository.dart';
import 'package:cupid_mentor/features/tips_gift/domain/use_cases/add_tips_gift.dart';
import 'package:cupid_mentor/features/tips_gift/domain/use_cases/get_tips_gift.dart';
import 'package:cupid_mentor/features/tips_replying/data/data_sources/tip_replying_datasource.dart';
import 'package:cupid_mentor/features/tips_replying/data/repository/tip_replying_repository.dart';
import 'package:cupid_mentor/features/tips_replying/domain/repository/tip_replying_repository.dart';
import 'package:cupid_mentor/features/tips_replying/domain/use_cases/add_message.dart';
import 'package:cupid_mentor/features/tips_replying/domain/use_cases/get_message.dart';
import 'package:cupid_mentor/features/tips_self_improvement/data/data_sources/tips_self_improvement_datasource.dart';
import 'package:cupid_mentor/features/tips_self_improvement/data/repository/tips_self_improvement_repository.dart';
import 'package:cupid_mentor/features/tips_self_improvement/domain/repository/tips_self_improvement_repository.dart';
import 'package:cupid_mentor/features/tips_self_improvement/domain/use_cases/add_tips_self_improvement.dart';
import 'package:cupid_mentor/features/tips_self_improvement/domain/use_cases/get_tips_self_improvement.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt get = GetIt.instance;

Future<void> _registerCore() async {
  get.registerLazySingleton<GenerativeModel>(
    () => GenerativeModel(model: 'gemini-1.5-flash', apiKey: GeminiApiKey.apiKey),
  );
  get.registerLazySingleton<Connectivity>(() => Connectivity());
  get.registerLazySingleton<GoogleAuthProvider>(() => GoogleAuthProvider());
  // get.registerFactoryParam<OAuthCredential, String, String>((accessToken, idToken) =>
  //     GoogleAuthProvider.credential(accessToken: accessToken, idToken: idToken));
  get.registerLazySingleton<GoogleSignIn>(
    () => kIsWeb ? GoogleSignIn(clientId: '') : GoogleSignIn(),
  );
  get.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  get.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  get.registerLazySingletonAsync<SharedPreferences>(() {
    final instance = SharedPreferences.getInstance();
    return instance;
  });

  await get.isReady<SharedPreferences>();
}

void _registerDataSources() {
  get.registerLazySingleton<LocalizationDatasource>(
    () => LocalizationDatasourceImpl(
      sharedPreferences: get(),
    ),
  );
  get.registerLazySingleton<AuthenticationRemoteDatasource>(
    () => AuthenticationRemoteDatasourceImpl(
      googleSignIn: get(),
      firebaseAuth: get(),
      googleAuthProvider: get(),
      firestore: get(),
    ),
  );
  get.registerLazySingleton<AuthenticationLocalDatasource>(
    () => AuthenticationLocalDatasourceImpl(),
  );

  get.registerLazySingleton<SplashDatasource>(() => SplashDatasourceImpl(sharedPreferences: get()));
  get.registerLazySingleton<OnboardingDatasource>(
    () => OnboardingDatasourceImpl(
      googleSignIn: get(),
      firebaseAuth: get(),
      googleAuthProvider: get(),
      firestore: get(),
    ),
  );
  get.registerLazySingleton<TipsSelfImprovementDatasource>(
    () => TipsSelfImprovementDatasourceImpl(firestore: get(), firebaseAuth: get()),
  );
  get.registerLazySingleton<TipsGiftDatasource>(
    () => TipsGiftDatasourceImpl(firestore: get(), firebaseAuth: get()),
  );
  get.registerLazySingleton<TipsDateSpotDatasource>(
    () => TipsDateSpotDatasourceImpl(firestore: get(), firebaseAuth: get()),
  );

  get.registerLazySingleton<TipsReplyingDatasource>(
    () => TipsReplyingDatasourceImpl(firestore: get(), firebaseAuth: get()),
  );
}

void _registerRepositories() {
  get.registerLazySingleton<LocalizationRepository>(
    () => LocalizationRepositoryImpl(datasource: get()),
  );
  get.registerLazySingleton<SplashRepositories>(
    () => SplashRepositoriesImpl(splashDatasource: get(), authenticationRemoteDatasource: get()),
  );
  get.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      remoteDatasource: get(),
      localDatasource: get(),
      connectivity: get(),
      sharedPreferences: get(),
    ),
  );
  get.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(datasource: get(), connectivity: get()),
  );
  get.registerLazySingleton<TipsSelfImprovementRepository>(
    () => TipsSelfImprovementRepositoryImpl(datasource: get(), connectivity: get()),
  );
  get.registerLazySingleton<TipsGiftRepository>(
    () => TipsGiftRepositoryImpl(datasource: get(), connectivity: get()),
  );
  get.registerLazySingleton<TipsDateSpotRepository>(
    () => TipsDateSpotRepositoryImpl(datasource: get(), connectivity: get()),
  );

  get.registerLazySingleton<TipsReplyingRepository>(
    () => TipsReplyingRepositoryImpl(datasource: get(), connectivity: get()),
  );
}

void _registerUseCases() {
  get.registerLazySingleton(() => CheckNeedOnboarding(repository: get()));
  get.registerLazySingleton(() => CheckNeedShowCase(repository: get()));
  get.registerLazySingleton(() => CheckNeedLogin(repository: get()));
  get.registerLazySingleton(() => ClearLanguageData(repository: get()));
  get.registerLazySingleton(() => GetLanguage(repository: get()));
  get.registerLazySingleton(() => SetLanguage(repository: get()));
  get.registerLazySingleton(() => LoginUseCase(repository: get()));
  get.registerLazySingleton(() => LogoutUseCase(repository: get()));
  get.registerLazySingleton(() => GetCurrentUser(repository: get()));
  get.registerLazySingleton(() => SaveUserInfo(repository: get()));
  get.registerLazySingleton(() => GetUserInfo(repository: get()));
  get.registerLazySingleton(() => GenerateAIContent(generativeModel: get()));
  get.registerLazySingleton(() => AddTipsSelfImprovement(repository: get()));
  get.registerLazySingleton(() => GetTipsSelfImprovement(repository: get()));
  get.registerLazySingleton(() => AddTipsGift(repository: get()));
  get.registerLazySingleton(() => GetTipsGift(repository: get()));
  get.registerLazySingleton(() => AddTipsDateSpot(repository: get()));
  get.registerLazySingleton(() => GetTipsDateSpot(repository: get()));
  get.registerLazySingleton(() => AddTipsReplying(repository: get()));
  get.registerLazySingleton(() => GetTipsReplying(repository: get()));
}

Future<void> setupLocator() async {
  await _registerCore();

  _registerDataSources();

  _registerRepositories();

  _registerUseCases();
}
