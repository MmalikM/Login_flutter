part of 'auth_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
  @override
  List<Object?> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String token;

  const LoggedIn({required this.token});

  @override
  List<Object?> get props => [token];

  @override
  String toString() {
    return 'LoggedIn(token: $token)';
  }
}

class LoggedOut extends AuthenticationEvent {}
