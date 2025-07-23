import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:injectable/injectable.dart';

import '../routes/app_router.dart';
import 'injection.config.dart';

GetIt getIt = GetIt.instance;
@InjectableInit(
  preferRelativeImports: true,
)
Future<void> configureInjection() async {
  debugPrint('Starting injection');
  // await sl.init();await
  getIt.registerLazySingleton<AppRouter>(() => AppRouter());
  getIt.init(environment: Environment.prod);
}
