// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
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
        return macos;
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
    apiKey: 'AIzaSyBlnfxhtOV4YwAB-BKzAzJXfVsYXLP1dso',
    appId: '1:1085165901528:web:63924778df6164ea3929ad',
    messagingSenderId: '1085165901528',
    projectId: 'grootly-app',
    authDomain: 'grootly-app.firebaseapp.com',
    storageBucket: 'grootly-app.appspot.com',
    measurementId: 'G-L543H9WFQ4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBIJPYcNBgEFyO8ILeiAWHUMkrFy1MZAW8',
    appId: '1:1085165901528:android:698151ecd52d6a973929ad',
    messagingSenderId: '1085165901528',
    projectId: 'grootly-app',
    storageBucket: 'grootly-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAHgg0n4nZqKlnK_dUQlLGaeqREi0VwQu8',
    appId: '1:1085165901528:ios:ade698062e20803b3929ad',
    messagingSenderId: '1085165901528',
    projectId: 'grootly-app',
    storageBucket: 'grootly-app.appspot.com',
    iosBundleId: 'com.example.grootlyApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAHgg0n4nZqKlnK_dUQlLGaeqREi0VwQu8',
    appId: '1:1085165901528:ios:f68e4d667e3e328c3929ad',
    messagingSenderId: '1085165901528',
    projectId: 'grootly-app',
    storageBucket: 'grootly-app.appspot.com',
    iosBundleId: 'com.example.grootlyApp.RunnerTests',
  );
}
