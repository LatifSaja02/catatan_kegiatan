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
    apiKey: 'AIzaSyA1s89rmpVTX6Tmwt5Sy3dMX3eSyJd1vgc',
    appId: '1:796747074811:web:bdb8f933bb227b6c9ef45e',
    messagingSenderId: '796747074811',
    projectId: 'catatan-kegiatan-59a31',
    authDomain: 'catatan-kegiatan-59a31.firebaseapp.com',
    storageBucket: 'catatan-kegiatan-59a31.appspot.com',
    measurementId: 'G-KLPCTLBPCR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpAmPj5Nmuau16WLleRPnprqc6OQBYyqU',
    appId: '1:796747074811:android:4632af1bcb3d5e2b9ef45e',
    messagingSenderId: '796747074811',
    projectId: 'catatan-kegiatan-59a31',
    storageBucket: 'catatan-kegiatan-59a31.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAB19nfYfI1kR8oB5Y53plPLDxeL_3tmFU',
    appId: '1:796747074811:ios:4297bdcfa3289b7c9ef45e',
    messagingSenderId: '796747074811',
    projectId: 'catatan-kegiatan-59a31',
    storageBucket: 'catatan-kegiatan-59a31.appspot.com',
    iosBundleId: 'com.example.catatanKegiatan',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAB19nfYfI1kR8oB5Y53plPLDxeL_3tmFU',
    appId: '1:796747074811:ios:4297bdcfa3289b7c9ef45e',
    messagingSenderId: '796747074811',
    projectId: 'catatan-kegiatan-59a31',
    storageBucket: 'catatan-kegiatan-59a31.appspot.com',
    iosBundleId: 'com.example.catatanKegiatan',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA1s89rmpVTX6Tmwt5Sy3dMX3eSyJd1vgc',
    appId: '1:796747074811:web:0c66ec80eb44f3509ef45e',
    messagingSenderId: '796747074811',
    projectId: 'catatan-kegiatan-59a31',
    authDomain: 'catatan-kegiatan-59a31.firebaseapp.com',
    storageBucket: 'catatan-kegiatan-59a31.appspot.com',
    measurementId: 'G-FTLZJNWJS7',
  );
}
