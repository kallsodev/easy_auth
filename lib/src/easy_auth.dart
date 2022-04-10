import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'bloc_observer.dart';

class EasyAuth {
  static void bootstrap({required Widget child}) {
    runZonedGuarded(
      () async {
        await BlocOverrides.runZoned(
          () async => runApp(child),
          blocObserver: AppBlocObserver(),
        );
      },
      (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
    );
  }

  static String get currentUserId => FirebaseAuth.instance.currentUser!.uid;

  static Future<FirebaseApp> initializeFirebase({
    String? name,
    FirebaseOptions? options,
  }) =>
      Firebase.initializeApp(name: name, options: options);
}
