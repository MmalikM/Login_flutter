import 'package:flutter/material.dart';


class ForgotPasswordPage extends StatelessWidget {
  static const routeName = "/forgotPass";

  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forgot Password Page")),
    );
  }
}

