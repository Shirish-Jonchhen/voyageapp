import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voyage/src/app/presentation/widgets/app_button.dart';
import 'package:voyage/src/app/presentation/widgets/app_card.dart';
import 'package:voyage/src/app/presentation/widgets/app_text_field.dart';
import 'package:voyage/src/core/extensions/padding_extension.dart';
import 'package:voyage/src/core/extensions/size_extension.dart';
import 'package:voyage/src/core/extensions/text_style_extension.dart';
import 'package:voyage/src/core/helper/assets_helper.dart';
import 'package:voyage/src/core/helper/snackbar_helper.dart';
import 'package:voyage/src/core/routes/app_router.dart';
import 'package:voyage/src/core/secret/env.dart';
import 'package:voyage/src/core/theme/app_styles.dart';
import 'package:voyage/src/features/auth/presentation/cubit/login/login_cubit.dart';

import '../../../../core/theme/app_colors.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //for email text field
  final FocusNode _focusNodeEmail = FocusNode();
  bool _isEmailFocused = false;
  final TextEditingController _emailController = TextEditingController();

  //for passwrod text field
  final FocusNode _focusNodePassword = FocusNode();
  bool _isPasswordFocused = false;
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordObs = true;

  void onObscureText() {
    setState(() {
      _passwordObs = !_passwordObs;
    });
  }

  @override
  void initState() {
    super.initState();
    _focusNodeEmail.addListener(() {
      setState(() {
        _isEmailFocused = _focusNodeEmail.hasFocus;
      });
    });

    _focusNodePassword.addListener(() {
      setState(() {
        _isPasswordFocused = _focusNodePassword.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: 20.padAll,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back".toUpperCase(),
                style: AppStyles.text12PxSemiBold.white,
              ),
              4.height,
              Text(
                "We Really Miss You to Learn Together Again",
                style: AppStyles.text24PxSemiBold.white,
              ),
              8.height,
              Text(
                "Enter the Email and Password of the account you have created",
                style: AppStyles.text12PxRegular.white,
              ),
              28.height,
              AppTextField(
                focusNode: _focusNodeEmail,
                isFocused: _isEmailFocused,
                hintText: "Email Address",
                controller: _emailController,
                iconData: Icons.email,
              ),
              16.height,
              AppTextField(
                focusNode: _focusNodePassword,
                isFocused: _isPasswordFocused,
                hintText: "Password",
                controller: _passwordController,
                obscureText: _passwordObs,
                onObscureText: onObscureText,
                iconData: Icons.lock,
              ),

              16.height,
              Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(
                        text: 'Forgot Password? ',
                        style: AppStyles.text12PxMedium.white,
                      ),
                      TextSpan(
                        text: 'Reset your password',
                        style: AppStyles.text12PxRegular.primaryGradient,
                      ),
                    ],
                  ),
                ),
              ),
              21.height,
              Center(child: Text('OR', style: AppStyles.text12PxRegular.white)),
              20.height,

              AppCard(
                padding: 12.5.padAll,
                borderRadius: 8,
                onTap: (){
                  context.router.push(const PreferencesSetupRoute());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetsHelper.appleLogo,
                      // Replace with your Google icon path
                      height: 20,
                      width: 20,
                      // color: AppColors.whitete,// Adjust the height as needed
                      // Adjust the width as needed
                    ),
                    8.width,
                    Text(
                      "login with Apple",
                      style: AppStyles.text16PxSemiBold.white,
                    ),
                  ],
                ),
              ),

              12.height,

               BlocBuilder<LoginCubit,LoginState>(
                 builder: (BuildContext context, LoginState state) =>
                 (state.maybeWhen(
                   orElse: () => false,
                   loading: () => true,
                 ))
                     ?
                 AppCard(
                   padding: 12.5.padAll,
                   borderRadius: 8,
                   onTap: (){
                     print("Loading state");
                   },
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Image.asset(
                         AssetsHelper.googleLogo,
                         // Replace with your Google icon path
                         height: 20,
                         width: 20,
                         // color: AppColors.whitete,// Adjust the height as needed
                         // Adjust the width as needed
                       ),
                       8.width,
                       Text(
                         "login with Google",
                         style: AppStyles.text16PxSemiBold.white,
                       ),
                     ],
                   ),

                 )
                     :
                    AppCard(
                      padding: 12.5.padAll,
                      borderRadius: 8,
                     onTap: (){
                       context.read<LoginCubit>().loginWithGoogle();
                     },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetsHelper.googleLogo,
                            // Replace with your Google icon path
                            height: 20,
                            width: 20,
                            // color: AppColors.whitete,// Adjust the height as needed
                            // Adjust the width as needed
                          ),
                          8.width,
                          Text(
                            "login with Google",
                            style: AppStyles.text16PxSemiBold.white,
                          ),
                        ],
                      ),

                    ),

               ),

            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: 20.padAll,
        child: SizedBox(
          height: 120,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  context.router.push(const RegisterRoute());
                },
                child: RichText(
                  text: TextSpan(
                    style: AppStyles.text12PxRegular.white,
                    children: [
                      TextSpan(
                        text: 'Don\'t have an account? ',
                        style: AppStyles.text12PxMedium.white,
                      ),
                      TextSpan(
                        text: 'Create account here',
                        style: AppStyles.text12PxRegular.primaryGradient,
                      ),
                    ],
                  ),
                ),
              ),

              BlocListener<LoginCubit, LoginState>(
                listener: (BuildContext context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    success: (message, response) {
                      SnackBarHelper.showSnackBar(
                        message: message,
                        context: context,
                      );
                    },
                    error: (message) {
                      SnackBarHelper.showSnackBar(
                        message: message,
                        context: context,
                        isError: true,
                      );
                    },
                  );
                },
                child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (BuildContext context, LoginState state) =>
                      (state.maybeWhen(
                        orElse: () => false,
                        loading: () => true,
                      ))
                      ? AppButton(onPressed: () async {}, title: "Loggin in...")
                      : AppButton(
                          onPressed: () async {
                            context.read<LoginCubit>().login(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                            );
                          },
                          title: "Login",
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
