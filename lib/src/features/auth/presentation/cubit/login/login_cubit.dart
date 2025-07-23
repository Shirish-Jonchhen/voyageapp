import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voyage/src/core/usecase/usecase.dart';
import '../../../../../core/errors/app_error.dart';

import '../../../domain/enitities/params/login_params.dart';
import '../../../domain/enitities/usecase/login_usecase.dart';
import '../../../domain/enitities/usecase/login_with_google_usecase.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState>{
  final LoginUseCase _loginUseCase;
  final LoginWithGoogleUseCase _loginWithGoogleUseCase;

  LoginCubit(this._loginUseCase, this._loginWithGoogleUseCase) : super(const LoginState.initial());

  Future<void> login({required String email, required String password}) async{
    emit(const LoginState.loading());
    final response =
    await _loginUseCase.call(LoginParams(email: email, password: password));
    emit(
      response.fold(
            (l) => l.when(
            serverError: (message) => LoginState.error(message: message),
            noInternet: () => const LoginState.noInternet()),
            (r) {
          return LoginState.success(message: r.message!, response: r.data!);
        },
      ),
    );
  }

  Future<void> loginWithGoogle() async {
    emit(const LoginState.loading());
    final response =
    await _loginWithGoogleUseCase.call(NoParams());
    emit(
      response.fold(
            (l) => l.when(
            serverError: (message) => LoginState.error(message: message),
            noInternet: () => const LoginState.noInternet()),
            (r) {
          return LoginState.success(message: r.message!, response: r.data!);
        },
      ),
    );
  }
}