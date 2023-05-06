import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:tech_test_zicare/bloc/login/login_bloc.dart';
import 'package:tech_test_zicare/pages/forgot_pass.dart';
import 'package:tech_test_zicare/pages/helper/helper.dart';
import 'package:tech_test_zicare/pages/register.dart';
import 'package:tech_test_zicare/repositories/repositories.dart';

class LoginForm extends StatefulWidget {
  final UserRepository userRepository;

  const LoginForm({Key? key, required this.userRepository}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<LoginForm> createState() => _LoginFormState(userRepository);
}

class _LoginFormState extends State<LoginForm> {
  final UserRepository userRepository;

  _LoginFormState(this.userRepository);

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(LoginButton(
          email: _usernameController.text, password: _passwordController.text));
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Login Failed"),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return SingleChildScrollView(
          child: Column(children: [
            Container(height: 150),
            const SizedBox(
              height: 200,
              width: 400,
              // color: Colors.black,
              child: Image(image: AssetImage("images/unnamed.jpg")),
            ),
            SafeArea(
                child: Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Column(children: [
                const SizedBox(height: 20.0),
                Form(
                  child: Column(children: [
                    Container(
                      decoration: ThemeHelper().inputBoxDecorationShaddow(),
                      child: TextFormField(
                        autocorrect: false,
                        autofocus: true,
                        decoration: ThemeHelper()
                            .textInputDecoration("Username", "Input Username"),
                        textInputAction: TextInputAction.next,
                        controller: _usernameController,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Container(
                      decoration: ThemeHelper().inputBoxDecorationShaddow(),
                      child: TextFormField(
                        autocorrect: false,
                        autofocus: true,
                        decoration: ThemeHelper()
                            .textInputDecoration("Password", "Input password"),
                        textInputAction: TextInputAction.next,
                        controller: _passwordController,
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordPage()),
                          );
                        },
                        child: const Text(
                          "Forgot your password?",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: OutlinedButton(
                          onPressed: _onLoginButtonPressed,
                          child: const Text("Login")),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage(
                                        // userRepository: userRepository,
                                        )),
                              );
                            },
                            child: const Text(
                              "Create",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ]),
            ))
          ]),
        );
      }),
    );
  }
}
