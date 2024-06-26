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
    apiKey: 'AIzaSyCrOoBahkiqOHqsnMLnabcGSFKf5Ryu2ow',
    appId: '1:719476794894:web:918c3c1404caf12e47fe5f',
    messagingSenderId: '719476794894',
    projectId: 'push-notification-54f57',
    authDomain: 'push-notification-54f57.firebaseapp.com',
    storageBucket: 'push-notification-54f57.appspot.com',
    measurementId: 'G-Q7GZE0J511',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDE2Y4afS31kXg0Bsgc-SgrSDKuS8y983A',
    appId: '1:1077982660299:android:fc0b8a79dbc6ec27687d4e',
    messagingSenderId: '1077982660299',
    projectId: 'push-notification-56bad',
    storageBucket: 'push-notification-56bad.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDrVDIhXw4nQJNx1Juq40PFf9wxqQt89aM',
    appId: '1:1077982660299:ios:bf7f596e0fb60f09687d4e',
    messagingSenderId: '1077982660299',
    projectId: 'push-notification-56bad',
    storageBucket: 'push-notification-56bad.appspot.com',
    iosBundleId: 'com.example.pushNotification',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBxMYZIgq_khUAs1Deenyj225J_4tQuUDE',
    appId: '1:719476794894:ios:85089dc33f5734ef47fe5f',
    messagingSenderId: '719476794894',
    projectId: 'push-notification-54f57',
    storageBucket: 'push-notification-54f57.appspot.com',
    iosBundleId: 'com.example.pushNotification',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCrOoBahkiqOHqsnMLnabcGSFKf5Ryu2ow',
    appId: '1:719476794894:web:a1afb704fb01190b47fe5f',
    messagingSenderId: '719476794894',
    projectId: 'push-notification-54f57',
    authDomain: 'push-notification-54f57.firebaseapp.com',
    storageBucket: 'push-notification-54f57.appspot.com',
    measurementId: 'G-CZN45NC937',
  );
}