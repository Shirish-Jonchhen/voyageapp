import 'package:equatable/equatable.dart';

class RegisterParams extends Equatable {
  final Map<String, dynamic> data;
  final String email;
  final String password;

  const RegisterParams({
    required this.data,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [data, email, password];
}