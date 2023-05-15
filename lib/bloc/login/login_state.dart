part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({required this.error});
  @override
  List<Object?> get props => [error];

  @override
  String toString() {
    return 'LoginFailure {error: $error}';
  }
}

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String error;

  const RegisterFailure({required this.error});
  @override
  List<Object?> get props => [error];

  @override
  String toString() {
    return 'RegisterFailure {error: $error}';
  }
}