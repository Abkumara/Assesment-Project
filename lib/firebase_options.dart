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
    apiKey: 'AIzaSyDO4SJKK5P14_s6Q-w_1lI83xYwQV7020Q',
    appId: '1:728987741051:web:353173c4c3120624b32bde',
    messagingSenderId: '728987741051',
    projectId: 'assesment-project-28f6c',
    authDomain: 'assesment-project-28f6c.firebaseapp.com',
    storageBucket: 'assesment-project-28f6c.appspot.com',
    measurementId: 'G-5BCSGFN9T7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHV99bt_z7IE6BD3aMg5Xj8uOp770BHEw',
    appId: '1:728987741051:android:6a9760f202a0e28db32bde',
    messagingSenderId: '728987741051',
    projectId: 'assesment-project-28f6c',
    storageBucket: 'assesment-project-28f6c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCJO4jl271gvSXtBQ0TU-NnepHoMW_a_AM',
    appId: '1:728987741051:ios:0f24877ec5df531db32bde',
    messagingSenderId: '728987741051',
    projectId: 'assesment-project-28f6c',
    storageBucket: 'assesment-project-28f6c.appspot.com',
    iosBundleId: 'com.example.assesmnetProject',
  );
}