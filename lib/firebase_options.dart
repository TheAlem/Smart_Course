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
    apiKey: 'AIzaSyAyVTfB5LkDacImErYXGyeSo4DvmNU2nC8',
    appId: '1:430096437897:web:05f51d9f22a3e2d5d6ec58',
    messagingSenderId: '430096437897',
    projectId: 'aulasmart-b556a',
    authDomain: 'aulasmart-b556a.firebaseapp.com',
    storageBucket: 'aulasmart-b556a.appspot.com',
    measurementId: 'G-N7JQRP2QE3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgjXNoyyEbJBMw1B_4xW9odMwQDblODog',
    appId: '1:430096437897:android:ebbbaee71fcc7c65d6ec58',
    messagingSenderId: '430096437897',
    projectId: 'aulasmart-b556a',
    storageBucket: 'aulasmart-b556a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBS4xsBrvBHBSiKwJ4fnyaCe64DTppAHTU',
    appId: '1:430096437897:ios:9b0044c2f00ac9f8d6ec58',
    messagingSenderId: '430096437897',
    projectId: 'aulasmart-b556a',
    storageBucket: 'aulasmart-b556a.appspot.com',
    iosBundleId: 'com.example.curseSmart',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBS4xsBrvBHBSiKwJ4fnyaCe64DTppAHTU',
    appId: '1:430096437897:ios:11e03801c02beda1d6ec58',
    messagingSenderId: '430096437897',
    projectId: 'aulasmart-b556a',
    storageBucket: 'aulasmart-b556a.appspot.com',
    iosBundleId: 'com.example.curseSmart.RunnerTests',
  );
}