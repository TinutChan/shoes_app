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
    apiKey: 'AIzaSyC11-ryKZm5Bdl6wsjDbtIkUanO34Af7-k',
    appId: '1:930276136204:web:e755ac62fc97cd7ef42529',
    messagingSenderId: '930276136204',
    projectId: 'shoesthesis',
    authDomain: 'shoesthesis.firebaseapp.com',
    storageBucket: 'shoesthesis.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB-N-dyrDoWzhK-1_e7YU0foWJYeogrmNY',
    appId: '1:930276136204:android:9cccac45ae606508f42529',
    messagingSenderId: '930276136204',
    projectId: 'shoesthesis',
    storageBucket: 'shoesthesis.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDWkrOyfQ1P4Qc0KgxPvnY-dQ-OC8nxkV4',
    appId: '1:930276136204:ios:28a836a9289e9dadf42529',
    messagingSenderId: '930276136204',
    projectId: 'shoesthesis',
    storageBucket: 'shoesthesis.appspot.com',
    iosClientId: '930276136204-s7esg6a3e0jtkllnvmqaqvjjprimm3un.apps.googleusercontent.com',
    iosBundleId: 'com.example.allpay',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDWkrOyfQ1P4Qc0KgxPvnY-dQ-OC8nxkV4',
    appId: '1:930276136204:ios:28a836a9289e9dadf42529',
    messagingSenderId: '930276136204',
    projectId: 'shoesthesis',
    storageBucket: 'shoesthesis.appspot.com',
    iosClientId: '930276136204-s7esg6a3e0jtkllnvmqaqvjjprimm3un.apps.googleusercontent.com',
    iosBundleId: 'com.example.allpay',
  );
}
