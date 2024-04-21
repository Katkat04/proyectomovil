import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA_a3afTE8myKkkbp2ECWlUwjSJHfiNcSk",
            authDomain: "proyecto-movil-fafl8v.firebaseapp.com",
            projectId: "proyecto-movil-fafl8v",
            storageBucket: "proyecto-movil-fafl8v.appspot.com",
            messagingSenderId: "255386672323",
            appId: "1:255386672323:web:301497748dfab1d67d5676"));
  } else {
    await Firebase.initializeApp();
  }
}
