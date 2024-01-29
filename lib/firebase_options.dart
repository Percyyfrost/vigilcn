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
    apiKey: 'AIzaSyCRH8kitv8U3aRABCB4-HmE6GWTWxUe2vA',
    appId: '1:418491761551:web:6107d42a8c28a7174681fa',
    messagingSenderId: '418491761551',
    projectId: 'vigilcn-591c5',
    authDomain: 'vigilcn-591c5.firebaseapp.com',
    storageBucket: 'vigilcn-591c5.appspot.com',
    measurementId: 'G-G1RNMH0S89',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD19G3ADAGYGxwLkmIkIycxdXS0J7PiQR8',
    appId: '1:418491761551:android:9d3f33e0cf82c5a14681fa',
    messagingSenderId: '418491761551',
    projectId: 'vigilcn-591c5',
    storageBucket: 'vigilcn-591c5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAzdjP-2aVj43DAHoRMJ0bqjiJXMBdbC_o',
    appId: '1:418491761551:ios:03302fccbe41cde24681fa',
    messagingSenderId: '418491761551',
    projectId: 'vigilcn-591c5',
    storageBucket: 'vigilcn-591c5.appspot.com',
    iosBundleId: 'com.svrge.vigilcn',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAzdjP-2aVj43DAHoRMJ0bqjiJXMBdbC_o',
    appId: '1:418491761551:ios:02524b6420f967d34681fa',
    messagingSenderId: '418491761551',
    projectId: 'vigilcn-591c5',
    storageBucket: 'vigilcn-591c5.appspot.com',
    iosBundleId: 'com.svrge.vigilcn.RunnerTests',
  );
}
