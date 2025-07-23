import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voyage/src/core/api_response/api_response.dart';
import 'package:voyage/src/core/usecase/usecase.dart';

import '../../../../../core/errors/app_error.dart';
import '../../repository/auth_repository.dart';
import '../params/login_params.dart';

@lazySingleton
class LoginUseCase extends UseCase<ApiResponse<AuthResponse>, LoginParams> {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  @override
  Future<Either<AppError, ApiResponse<AuthResponse>>> call(LoginParams params) async {
    return await _authRepository.signIn(params.email, params.password);
  }
}