part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState{
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.noInternet() = _NoInternet;
  const factory LoginState.error({required String message}) = _Error;
  const factory LoginState.success({required String message, required AuthResponse response}) = _Success;
}