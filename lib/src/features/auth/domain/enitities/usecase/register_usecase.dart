import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voyage/src/features/auth/domain/enitities/params/register_params.dart';

import '../../../../../core/api_response/api_response.dart';
import '../../../../../core/errors/app_error.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../repository/auth_repository.dart';

@lazySingleton
class RegisterUsecase extends UseCase<ApiResponse<AuthResponse>, RegisterParams> {
  final AuthRepository _authRepository;

  RegisterUsecase(this._authRepository);

  @override
  Future<Either<AppError, ApiResponse<AuthResponse>>> call(RegisterParams params) async {
    return await _authRepository.signUp(params.email, params.password, params.data);
  }
}