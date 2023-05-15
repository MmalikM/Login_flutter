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

abstract class RegisterEvent extends Equatable{
  const RegisterEvent();
}

@immutable
class RegisterButton extends RegisterEvent {
  final String full_name;
  final String username;
  final String email;
  final String password;

  const RegisterButton({required this.full_name, required this.username,required this.email,required this.password});

  @override
  List<Object?> get props => [full_name,username, email, password];

  @override
  String toString(){
    return 'RegisterButtonPressed { email: $email, password: $password }';
  }
}