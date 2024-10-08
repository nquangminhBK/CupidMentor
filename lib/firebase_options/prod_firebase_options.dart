// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'prod_firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA0B6MRNOXQ2gvzgLSq-Uxbrkte-TgOW8Q',
    appId: '1:979013705313:web:18e7a966b77e19a4f25420',
    messagingSenderId: '979013705313',
    projectId: 'cupid-mentor',
    authDomain: 'cupid-mentor.firebaseapp.com',
    storageBucket: 'cupid-mentor.appspot.com',
    measurementId: 'G-WC7MKVWHQJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB3lajwWT5evrpQXrVDF7D7Mqq9xl7jrBo',
    appId: '1:979013705313:android:e172879224e97595f25420',
    messagingSenderId: '979013705313',
    projectId: 'cupid-mentor',
    storageBucket: 'cupid-mentor.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBobEPf7GnJmjowNej93UTwcklLeOOV9cg',
    appId: '1:979013705313:ios:fbc70f4f210340e9f25420',
    messagingSenderId: '979013705313',
    projectId: 'cupid-mentor',
    storageBucket: 'cupid-mentor.appspot.com',
    iosBundleId: 'com.quangminh.cupidMentor',
  );
}
