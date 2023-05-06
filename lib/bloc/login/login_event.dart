part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable{
  const LoginEvent();
}

class LoginButton extends LoginEvent {
  final String email;
  final String password;

  const LoginButton({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];

  @override
  String toString(){
    return 'LoginButtonPressed { email: $email, password: $password }';
  }
}