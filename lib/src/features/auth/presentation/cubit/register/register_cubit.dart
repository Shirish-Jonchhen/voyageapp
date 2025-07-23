import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voyage/src/core/errors/app_error.dart';
import 'package:voyage/src/features/auth/domain/enitities/usecase/register_usecase.dart';

import '../../../domain/enitities/params/register_params.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUsecase _registerUseCase;

  RegisterCubit(this._registerUseCase) : super(const RegisterState.initial());

  Future<void> register({
    required String email,
    required String password,
    required Map<String, dynamic> data,
  }) async {
    emit(const RegisterState.loading());
    final response = await _registerUseCase.call(
      RegisterParams(
        email: email,
        password: password,
        data: data,
      ),
    );
    emit(
      response.fold(
        (l) => l.when(
          serverError: (message) => RegisterState.error(message: message),
          noInternet: () => const RegisterState.noInternet(),
        ),
        (r) => RegisterState.success(message: r.message!, response: r.data!),
      ),
    );
  }
}