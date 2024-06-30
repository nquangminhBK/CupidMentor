import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cupid_mentor/features/auth/data/datasources/authentication_local_datasource.dart';
import 'package:cupid_mentor/features/auth/data/datasources/authentication_remote_datasource.dart';
import 'package:cupid_mentor/features/auth/data/repositories/authentication_repository.dart';
import 'package:cupid_mentor/features/auth/domain/repositories/authentication_repository.dart';
import 'package:cupid_mentor/features/auth/domain/use_cases/signin.dart';
import 'package:cupid_mentor/features/auth/domain/use_cases/signout.dart';
import 'package:cupid_mentor/features/onboarding/domain/use_cases/get_current_user.dart';
import 'package:cupid_mentor/features/splash_screen/data/data_sources/splash_datasources.dart';
import 'package:cupid_mentor/features/splash_screen/data/repositories/splash_repositories.dart';
import 'package:cupid_mentor/features/splash_screen/domain/repositories/splash_repositories.dart';
import 'package:cupid_mentor/features/splash_screen/domain/use_cases/check_is_logged_in.dart';
import 'package:cupid_mentor/features/splash_screen/domain/use_cases/check_need_onboarding.dart';
import 'package:cupid_mentor/features/splash_screen/domain/use_cases/check_need_showcase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt get = GetIt.instance;

Future<void> _registerCore() async {
  get.registerLazySingleton<Connectivity>(() => Connectivity());
  get.registerLazySingleton<GoogleAuthProvider>(() => GoogleAuthProvider());
  // get.registerFactoryParam<OAuthCredential, String, String>((accessToken, idToken) =>
  //     GoogleAuthProvider.credential(accessToken: accessToken, idToken: idToken));
  get.registerLazySingleton<GoogleSignIn>(
      () => kIsWeb ? GoogleSignIn(clientId: "") : GoogleSignIn());
  get.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  get.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  get.registerLazySingletonAsync<SharedPreferences>(() {
    final instance = SharedPreferences.getInstance();
    return instance;
  });

  await get.isReady<SharedPreferences>();
}

void _registerDataSources() {
  get.registerLazySingleton<AuthenticationRemoteDatasource>(() =>
      AuthenticationRemoteDatasourceImpl(
          googleSignIn: get(), firebaseAuth: get(), googleAuthProvider: get(), firestore: get()));
  get.registerLazySingleton<AuthenticationLocalDatasource>(
      () => AuthenticationLocalDatasourceImpl());

  get.registerLazySingleton<SplashDatasource>(() => SplashDatasourceImpl(sharedPreferences: get()));
}

void _registerRepositories() {
  get.registerLazySingleton<SplashRepositories>(
      () => SplashRepositoriesImpl(splashDatasource: get(), authenticationRemoteDatasource: get()));
  get.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepositoryImpl(
      remoteDatasource: get(), localDatasource: get(), connectivity: get()));
}

void _registerUseCases() {
  get.registerLazySingleton(() => CheckNeedOnboarding(repository: get()));
  get.registerLazySingleton(() => CheckNeedShowCase(repository: get()));
  get.registerLazySingleton(() => CheckNeedLogin(repository: get()));
  get.registerLazySingleton(() => LoginUseCase(repository: get()));
  get.registerLazySingleton(() => LogoutUseCase(repository: get()));
  get.registerLazySingleton(() => GetCurrentUser(repository: get()));
}

Future<void> setupLocator() async {
  await _registerCore();

  _registerDataSources();

  _registerRepositories();

  _registerUseCases();
}
