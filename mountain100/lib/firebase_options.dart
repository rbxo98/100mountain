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
    apiKey: 'AIzaSyDUOr4xVZ9oHctAHWMs20k7Sl9IX8kRDzw',
    appId: '1:1005582649639:web:3af5d22de32bae2cd54102',
    messagingSenderId: '1005582649639',
    projectId: 'mountain-e6a92',
    authDomain: 'mountain-e6a92.firebaseapp.com',
    storageBucket: 'mountain-e6a92.appspot.com',
    measurementId: 'G-KSZ82RVJES',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAX4BH5q7Pt98rXrylkGmppTVFZXw13FEs',
    appId: '1:1005582649639:android:e499637508debeb5d54102',
    messagingSenderId: '1005582649639',
    projectId: 'mountain-e6a92',
    storageBucket: 'mountain-e6a92.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCrlkePNSfJpQEiTREWKzVlphNAEU8vmaQ',
    appId: '1:1005582649639:ios:f22c554c1fbe0bd1d54102',
    messagingSenderId: '1005582649639',
    projectId: 'mountain-e6a92',
    storageBucket: 'mountain-e6a92.appspot.com',
    androidClientId: '1005582649639-5f8mv9a27cafd5bolomffkfhraae1mp2.apps.googleusercontent.com',
    iosClientId: '1005582649639-omrbgguqusbav7uq2coui73aljehpmtd.apps.googleusercontent.com',
    iosBundleId: 'com.example.mountain100',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCrlkePNSfJpQEiTREWKzVlphNAEU8vmaQ',
    appId: '1:1005582649639:ios:f22c554c1fbe0bd1d54102',
    messagingSenderId: '1005582649639',
    projectId: 'mountain-e6a92',
    storageBucket: 'mountain-e6a92.appspot.com',
    androidClientId: '1005582649639-5f8mv9a27cafd5bolomffkfhraae1mp2.apps.googleusercontent.com',
    iosClientId: '1005582649639-omrbgguqusbav7uq2coui73aljehpmtd.apps.googleusercontent.com',
    iosBundleId: 'com.example.mountain100',
  );
}
