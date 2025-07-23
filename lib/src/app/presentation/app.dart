import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage/src/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:voyage/src/features/auth/presentation/cubit/register/register_cubit.dart';


import '../../core/di/injection.dart';
import '../../core/routes/app_router.dart';

class App extends StatelessWidget {
  App({super.key});
  final router = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => getIt<LoginCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<RegisterCubit>(),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(color: Colors.black),
          ),
        ),
        // routerDelegate: router.delegate(),
        debugShowCheckedModeBanner: false,
        // routeInformationParser: router.defaultRouteParser(),
        routerConfig: router.config(),
        title: 'Voyage',
      ),
    );
  }
}
