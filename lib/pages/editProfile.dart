import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  static const routeName = "/home";

  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile")),
    );
  }
}
