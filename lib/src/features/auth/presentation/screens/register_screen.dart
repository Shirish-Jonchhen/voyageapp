import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voyage/src/core/extensions/padding_extension.dart';
import 'package:voyage/src/core/extensions/size_extension.dart';
import 'package:voyage/src/core/extensions/text_style_extension.dart';
import 'package:voyage/src/features/auth/presentation/cubit/register/register_cubit.dart';

import '../../../../app/presentation/widgets/app_button.dart';
import '../../../../app/presentation/widgets/app_card.dart';
import '../../../../app/presentation/widgets/app_text_field.dart';
import '../../../../core/helper/assets_helper.dart';
import '../../../../core/helper/snackbar_helper.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../cubit/login/login_cubit.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //for email text field
  final FocusNode _focusNodeName = FocusNode();
  bool _isNameFocused = false;
  final TextEditingController _nameController = TextEditingController();

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

    _focusNodeName.addListener(() {
      setState(() {
        _isNameFocused = _focusNodeName.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _focusNodeName.dispose();
    _nameController.dispose();
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
                "create account".toUpperCase(),
                style: AppStyles.text12PxSemiBold.white,
              ),
              4.height,
              Text(
                "Wow You're Really Here, Let's Start Learning Together",
                style: AppStyles.text24PxSemiBold.white,
              ),
              8.height,
              Text(
                "Create your account first to learn with other friends",
                style: AppStyles.text12PxRegular.white,
              ),
              28.height,
              AppTextField(
                focusNode: _focusNodeName,
                isFocused: _isNameFocused,
                hintText: "Name",
                controller: _nameController,
                iconData: Icons.person,
              ),
              16.height,
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
                child:
                      Text('By creating an account you agree to our \n Terms of Service and Privacy Policy ' ,style: AppStyles.text12PxMedium.white, textAlign: TextAlign.center,),

                  ),


              21.height,
              Center(child: Text('OR',style: AppStyles.text12PxRegular.white,),),
              20.height,

              AppCard(
                padding: 12.5.padAll,
                borderRadius: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetsHelper.appleLogo, // Replace with your Google icon path
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
        child: Container(
          height: 120,
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  context.router.pop();
                },
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(text: 'Already have an account? ' ,style: AppStyles.text12PxMedium.white),
                      TextSpan(
                        text: 'Login here',
                        style: AppStyles.text12PxRegular.primaryGradient,
                      ),
                    ],
                  ),
                ),
              ),
              BlocListener<RegisterCubit, RegisterState>(
                listener: (BuildContext context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    success: (message, response) {

                      SnackBarHelper.showSnackBar(message: message, context: context);

                    },
                    error: (message) {
                      SnackBarHelper.showSnackBar(message: message, context: context, isError: true);

                    },
                  );
                },
                child: BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (BuildContext context, RegisterState state) =>
                  (state.maybeWhen(orElse: () => false, loading: () => true))
                      ? AppButton(onPressed: () async {}, title: "Signing up...")
                      : AppButton(
                    onPressed: () async {
                      context.read<RegisterCubit>().register(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                        data: {
                          'username': _nameController.text.trim(),
                        }
                      );
                    },
                    title: "Continue",
                  ),
                ),
              ),
            // Continue  AppButton(
            //     onPressed: (){
            //
            //     },
            //     title: "Continue",
            //   ),
            ],
          ),
        ),
      ),
    );
  }
}
