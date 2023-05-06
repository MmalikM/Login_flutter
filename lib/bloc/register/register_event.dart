part of 'register_bloc.dart';


@immutable
abstract class RegisterEvent extends Equatable{
  const RegisterEvent();
}

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