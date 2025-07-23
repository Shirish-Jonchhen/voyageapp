import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voyage/src/core/usecase/usecase.dart';

import '../../../../../core/api_response/api_response.dart';
import '../../../../../core/errors/app_error.dart';
import '../../repository/auth_repository.dart';

@lazySingleton
class LoginWithGoogleUseCase extends UseCase<ApiResponse<AuthResponse>, NoParams> {
  final AuthRepository _authRepository;

  LoginWithGoogleUseCase(this._authRepository);

  @override
  Future<Either<AppError, ApiResponse<AuthResponse>>> call(NoParams params) async {
    return await _authRepository.signInWithGoogle();
  }
}