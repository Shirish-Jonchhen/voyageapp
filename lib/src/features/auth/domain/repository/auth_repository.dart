import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/api_response/api_response.dart';
import '../../../../core/errors/app_error.dart';

abstract class AuthRepository {
  Future<Either<AppError, ApiResponse<AuthResponse>>>  signIn(String email, String password);
  Future<Either<AppError, ApiResponse<AuthResponse>>> signUp(String email, String password, Map<String, dynamic>? data);
  Future<Either<AppError, ApiResponse<AuthResponse>>> signInWithGoogle();
}