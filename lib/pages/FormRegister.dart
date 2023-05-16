import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tech_test_zicare/bloc/auth_bloc/auth_bloc.dart';
import 'package:tech_test_zicare/bloc/login/login_bloc.dart';
import 'package:tech_test_zicare/pages/helper/helper.dart';
import 'package:tech_test_zicare/repositories/repositories.dart';

import 'login.dart';
import 'profile.dart';

class FormRegister extends StatefulWidget {
  final UserRepository userRepository;

  const FormRegister({Key? key, required this.userRepository})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<FormRegister> createState() => _RegisterFormState(userRepository);
}

class _RegisterFormState extends State<FormRegister> {
  final UserRepository userRepository;

  _RegisterFormState(this.userRepository);

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    _onRegisterButtonPressed() {
      BlocProvider.of<RegisterBloc>(context).add(RegisterButton(
          full_name: _fullNameController.text,
          username: _usernameController.text,
          email: _emailController.text,
          password: _passwordController.text));
    }

    return BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
      if (state is RegisterFailure) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Register Failed"),
          backgroundColor: Colors.red,
        ));
      } else if (state is RegisterInitial){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Register success, \n silahkan kembali ke login"),
          backgroundColor: Colors.blue,
        ));
      }
    }, child:
            // const Text("hallo dek"),
            BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return SingleChildScrollView(
        child: Stack(children: [
          Container(
            height: 120,
            color: const Color.fromARGB(1000, 114, 221, 247),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(25, 30, 25, 10),
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
            alignment: Alignment.center,
            child: Column(children: [
              Form(
                  child: Column(
                children: [
                  GestureDetector(
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(width: 5, color: Colors.white),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 20,
                                offset: Offset(5, 5),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.person,
                            color: Colors.grey.shade300,
                            size: 80.0,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(80, 80, 0, 0),
                          child: Icon(
                            Icons.add_circle,
                            color: Colors.grey.shade700,
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: ThemeHelper().inputBoxDecorationShaddow(),
                    child: TextFormField(
                      autocorrect: false,
                      autofocus: true,
                      decoration: ThemeHelper()
                          .textInputDecoration("Full Name", "Input Full Name"),
                      textInputAction: TextInputAction.next,
                      controller: _fullNameController,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
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
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: ThemeHelper().inputBoxDecorationShaddow(),
                    child: TextFormField(
                      autocorrect: false,
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: ThemeHelper()
                          .textInputDecoration("Email", "Input Email"),
                      textInputAction: TextInputAction.next,
                      controller: _emailController,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: ThemeHelper().inputBoxDecorationShaddow(),
                    child: TextFormField(
                      autocorrect: false,
                      autofocus: true,
                      obscureText: true,
                      decoration: ThemeHelper()
                          .textInputDecoration("Password", "Input Password"),
                      textInputAction: TextInputAction.next,
                      controller: _passwordController,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(value: true, onChanged: (value) {}),
                            const Text(
                              "I accept all terms and conditions.",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: OutlinedButton(
                        onPressed: _onRegisterButtonPressed,
                        child: const Text(
                          "register",
                        )),
                  ),
                  const SizedBox(height: 30.0),
                  const Text(
                    "Or create account using social media",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: FaIcon(
                          FontAwesomeIcons.googlePlus,
                          size: 35,
                          color: HexColor("#EC2D2F"),
                        ),
                      ),
                      const SizedBox(
                        width: 30.0,
                      ),
                      GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                width: 5, color: HexColor("#40ABF0")),
                            color: HexColor("#40ABF0"),
                          ),
                          child: FaIcon(
                            FontAwesomeIcons.twitter,
                            size: 23,
                            color: HexColor("#FFFFFF"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30.0,
                      ),
                      GestureDetector(
                        child: FaIcon(
                          FontAwesomeIcons.facebook,
                          size: 35,
                          color: HexColor("#3E529C"),
                        ),
                      ),
                    ],
                  ),
                ],
              ))
            ]),
          )
        ]),
      );
    }));
  }
}
