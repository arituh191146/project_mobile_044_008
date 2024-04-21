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
    apiKey: 'AIzaSyBjcu0FaZnNV2BtnciaezZAD3Fx-VI1iEk',
    appId: '1:566324378456:web:63fb8e810826a5d3b0032d',
    messagingSenderId: '566324378456',
    projectId: 'project-283-d9fb9',
    authDomain: 'project-283-d9fb9.firebaseapp.com',
    storageBucket: 'project-283-d9fb9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC1Y_sdRUSiWjcAImUzgktA7mBiHNaZxC0',
    appId: '1:566324378456:android:038bfacfe7b777b9b0032d',
    messagingSenderId: '566324378456',
    projectId: 'project-283-d9fb9',
    storageBucket: 'project-283-d9fb9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAqiDlekvU1yZiUrIBe7Ei-Xm9NFxcHzl0',
    appId: '1:566324378456:ios:2a091e468cf73a2db0032d',
    messagingSenderId: '566324378456',
    projectId: 'project-283-d9fb9',
    storageBucket: 'project-283-d9fb9.appspot.com',
    iosBundleId: 'com.example.mobileapplicationproject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAqiDlekvU1yZiUrIBe7Ei-Xm9NFxcHzl0',
    appId: '1:566324378456:ios:2a091e468cf73a2db0032d',
    messagingSenderId: '566324378456',
    projectId: 'project-283-d9fb9',
    storageBucket: 'project-283-d9fb9.appspot.com',
    iosBundleId: 'com.example.mobileapplicationproject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBjcu0FaZnNV2BtnciaezZAD3Fx-VI1iEk',
    appId: '1:566324378456:web:d32cd575367fe53db0032d',
    messagingSenderId: '566324378456',
    projectId: 'project-283-d9fb9',
    authDomain: 'project-283-d9fb9.firebaseapp.com',
    storageBucket: 'project-283-d9fb9.appspot.com',
  );
}