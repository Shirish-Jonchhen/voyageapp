// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voyage/src/core/secret/env.dart';

import 'src/core/di/injection.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  debugPrint("Starting app 3");
  FlutterError.onError = (details) {
    debugPrint("Starting app 4");

    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  try {
    await configureInjection();




    Bloc.observer = AppBlocObserver();
    await runZonedGuarded(
          () async {
        debugPrint("Starting app 5");
        await Supabase.initialize(
          url: SUPABASE_URL,
          anonKey: SUPABASE_ANON_KEY,
        );

        runApp(await builder());
      },
          (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
    );
  } catch (e, stackTrace) {
    debugPrint("Starting app 6");

    log('Exception caught: $e', stackTrace: stackTrace);
    // Handle the exception as needed
  }
}
