import 'package:dartz/dartz.dart';
import 'package:gotrue/src/types/auth_response.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api_response/api_response.dart';
import '../../../../core/errors/app_exceptions.dart';
import '../source/auth_remote_source.dart';

import '../../../../core/errors/app_error.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repository/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteSource _authRemoteSource;
  final NetworkInfo _networkInfo;

  const AuthRepositoryImpl(this._authRemoteSource, this._networkInfo);

  @override
  Future<Either<AppError, ApiResponse<AuthResponse>>> signIn(
    String email,
    String password,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _authRemoteSource.signIn(email, password);
        return Right(response);
      } on AppException catch (e) {
        return Left(AppError.serverError(message: e.message));
      } catch (e) {
        return Left(
          AppError.serverError(message: "An unexpected error occurred"),
        );
      }
    } else {
      return Left(AppError.noInternet());
    }
  }

  @override
  Future<Either<AppError, ApiResponse<AuthResponse>>> signUp(
    String email,
    String password,
    Map<String, dynamic>? data,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _authRemoteSource.signUp(email, password, data);
        return Right(response);
      } on AppException catch (e) {
        return Left(AppError.serverError(message: e.message));
      } catch (e) {
        return Left(
          AppError.serverError(message: "An unexpected error occurred"),
        );
      }
    } else {
      return Left(AppError.noInternet());
    }
  }

  @override
  Future<Either<AppError, ApiResponse<AuthResponse>>> signInWithGoogle() async{
    if (await _networkInfo.isConnected) {
      try {
        final response = await _authRemoteSource.signInWithGoogle();
        return Right(response);
      } on AppException catch (e) {
        return Left(AppError.serverError(message: e.message));
      } catch (e) {
        return Left(
          AppError.serverError(message: "An unexpected error occurred"),
        );
      }
    } else {
      return Left(AppError.noInternet());
    }
  }
}
