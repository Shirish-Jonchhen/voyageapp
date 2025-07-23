import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bootstrap.dart';
import 'src/app/presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await configureInjection();
  // configLoading();



  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // or any color
      statusBarBrightness: Brightness.dark, // for iOS (makes text white)
      statusBarIconBrightness: Brightness.light, // for Android
    ),
  );

  debugPrint('Starting app');
  bootstrap(() {
    debugPrint('Starting app 2');
    return App();
  });
}
