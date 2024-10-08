// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAxFSWueJcrEzqJf3gG-4SOV7NwVCEg010',
    appId: '1:840223818220:web:21a9eab334bcb5693e80c9',
    messagingSenderId: '840223818220',
    projectId: 'my-taber',
    authDomain: 'my-taber.firebaseapp.com',
    storageBucket: 'my-taber.appspot.com',
    measurementId: 'G-BZFQQFVZN7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBy1oS1bReOlJaKkj4-acD9M-hS0aeF4_0',
    appId: '1:840223818220:android:7f675244605e47113e80c9',
    messagingSenderId: '840223818220',
    projectId: 'my-taber',
    storageBucket: 'my-taber.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBEWLjjRB1zSk8AWJXqThrZJDXQSfUOotI',
    appId: '1:840223818220:ios:602ea68a483d77c23e80c9',
    messagingSenderId: '840223818220',
    projectId: 'my-taber',
    storageBucket: 'my-taber.appspot.com',
    iosBundleId: 'com.example.mytaber',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBEWLjjRB1zSk8AWJXqThrZJDXQSfUOotI',
    appId: '1:840223818220:ios:602ea68a483d77c23e80c9',
    messagingSenderId: '840223818220',
    projectId: 'my-taber',
    storageBucket: 'my-taber.appspot.com',
    iosBundleId: 'com.example.mytaber',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAxFSWueJcrEzqJf3gG-4SOV7NwVCEg010',
    appId: '1:840223818220:web:e9390952a9d4a7d33e80c9',
    messagingSenderId: '840223818220',
    projectId: 'my-taber',
    authDomain: 'my-taber.firebaseapp.com',
    storageBucket: 'my-taber.appspot.com',
    measurementId: 'G-6REJYN35BH',
  );
}
