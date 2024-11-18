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
    apiKey: 'AIzaSyBL2GtWTg9F58o1pPPnKi9lUb3r9ezJOsw',
    appId: '1:954449241874:web:e0090c74038c6c0c02b5cb',
    messagingSenderId: '954449241874',
    projectId: 'grapegrow-subsmission-pemula',
    authDomain: 'grapegrow-subsmission-pemula.firebaseapp.com',
    storageBucket: 'grapegrow-subsmission-pemula.appspot.com',
    measurementId: 'G-2D43MXVFCB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAsaBBLCepdOM8bR21q8FJr-butZn-cZTA',
    appId: '1:954449241874:android:893fc095593af5c602b5cb',
    messagingSenderId: '954449241874',
    projectId: 'grapegrow-subsmission-pemula',
    storageBucket: 'grapegrow-subsmission-pemula.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDqe6yDscrZBsi0Ij5ZaXoJAhKYZZ6HisI',
    appId: '1:954449241874:ios:8f24c7eaf50a6eaa02b5cb',
    messagingSenderId: '954449241874',
    projectId: 'grapegrow-subsmission-pemula',
    storageBucket: 'grapegrow-subsmission-pemula.appspot.com',
    iosBundleId: 'com.example.grapegrowSubmission',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDqe6yDscrZBsi0Ij5ZaXoJAhKYZZ6HisI',
    appId: '1:954449241874:ios:8f24c7eaf50a6eaa02b5cb',
    messagingSenderId: '954449241874',
    projectId: 'grapegrow-subsmission-pemula',
    storageBucket: 'grapegrow-subsmission-pemula.appspot.com',
    iosBundleId: 'com.example.grapegrowSubmission',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBL2GtWTg9F58o1pPPnKi9lUb3r9ezJOsw',
    appId: '1:954449241874:web:de66651ad008ded102b5cb',
    messagingSenderId: '954449241874',
    projectId: 'grapegrow-subsmission-pemula',
    authDomain: 'grapegrow-subsmission-pemula.firebaseapp.com',
    storageBucket: 'grapegrow-subsmission-pemula.appspot.com',
    measurementId: 'G-MZVCYY9EVL',
  );

}