import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_test_zicare/bloc/auth_bloc/auth_bloc.dart';
import 'package:tech_test_zicare/bloc/login/login_bloc.dart';
import 'package:tech_test_zicare/repositories/repositories.dart';
import 'package:tech_test_zicare/pages/login_form.dart';

class LoginPage extends StatelessWidget {
  static const routeName = "/login";
  final UserRepository userRepository;  
  const LoginPage({Key? key, required this.userRepository}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) {
              return LoginBloc(
            authenticationBloc : BlocProvider.of<AuthenticationBloc>(context),
            userRepository : userRepository,
          );
          },
          child: LoginForm(
            userRepository: userRepository ,
          ),
        )
        );
  }
}
