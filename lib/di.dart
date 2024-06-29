import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cupid_mentor/features/auth/data/datasources/authentication_remote_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt get = GetIt.instance;

Future<void> setupLocator() async {
  get.registerLazySingleton<Connectivity>(() => Connectivity());
  get.registerLazySingleton<GoogleAuthProvider>(() => GoogleAuthProvider());
  // get.registerFactoryParam<OAuthCredential, String, String>((accessToken, idToken) =>
  //     GoogleAuthProvider.credential(accessToken: accessToken, idToken: idToken));
  get.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
  get.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  get.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  get.registerLazySingletonAsync<SharedPreferences>(() {
    final instance = SharedPreferences.getInstance();
    return instance;
  });

  await get.isReady<SharedPreferences>();

  get.registerLazySingleton<AuthenticationRemoteDatasource>(() =>
      AuthenticationRemoteDatasourceImpl(
          googleSignIn: get(), firebaseAuth: get(), googleAuthProvider: get(), firestore: get()));
}
