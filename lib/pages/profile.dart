import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_test_zicare/bloc/auth_bloc/auth_bloc.dart';
import 'package:tech_test_zicare/bloc/user/user_bloc.dart';
import 'package:tech_test_zicare/model/profile.dart';
import 'package:tech_test_zicare/pages/editProfile.dart';
import 'package:tech_test_zicare/pages/forgot_pass.dart';
import 'package:tech_test_zicare/pages/home.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final UserBloc _userBloc = UserBloc();

  final double _drawerIconSize = 24;
  final double _drawerFontSize = 17;

  @override
  void initState() {
    _userBloc.add(GetUserList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 137, 169, 196),
        appBar: AppBar(
          title: const Text(
            "Profile Page",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          elevation: 0.5,
          iconTheme: const IconThemeData(color: Colors.white),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                  Theme.of(context).primaryColor,
                  Colors.transparent
                ])),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(
                top: 16,
                right: 16,
              ),
              child: Stack(
                children: [
                  const Icon(Icons.notifications),
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                      child: const Text(
                        '5',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        drawer: Drawer(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [
                  0.0,
                  1.0
                ],
                    colors: [
                  Colors.white.withOpacity(0.2),
                  Colors.grey.shade100.withOpacity(0.5),
                ])),
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: const [0.0, 1.0],
                      colors: [
                        Colors.lightBlue.shade100,
                        Colors.white,
                      ],
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "ZiCare \n Mobile",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home_rounded,
                      size: _drawerIconSize,
                      color: Theme.of(context).colorScheme.secondary),
                  title: Text(
                    'Home',
                    style: TextStyle(
                        fontSize: _drawerFontSize,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
                Divider(
                  color: Theme.of(context).primaryColor,
                  height: 1,
                ),
                ListTile(
                  leading: Icon(Icons.edit_note,
                      size: _drawerIconSize,
                      color: Theme.of(context).colorScheme.secondary),
                  title: Text(
                    'Edit Profile',
                    style: TextStyle(
                        fontSize: _drawerFontSize,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProfile()),
                    );
                  },
                ),
                Divider(
                  color: Theme.of(context).primaryColor,
                  height: 1,
                ),
                ListTile(
                  leading: Icon(
                    Icons.password_rounded,
                    size: _drawerIconSize,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  title: Text(
                    'Change Password',
                    style: TextStyle(
                        fontSize: _drawerFontSize,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPasswordPage()),
                    );
                  },
                ),
                Divider(
                  color: Theme.of(context).primaryColor,
                  height: 1,
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout_rounded,
                    size: _drawerIconSize,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                        fontSize: _drawerFontSize,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  onTap: () {
                    BlocProvider.of<AuthenticationBloc>(context)
                        .add(LoggedOut());
                  },
                ),
              ],
            ),
          ),
        ),
        body: BlocProvider(
          create: (_) => _userBloc,
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoaded) {
                return detailProfile(context, state.userProfile);
              } else {
                return detailProfileDummy(context);
              }
            },
          ),
        ));
  }
}

Widget detailProfile(BuildContext context, UserProfile user) {
  return SingleChildScrollView(
    child: Stack(children: [
      Container(
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
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
      ),
      Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(25, 100, 25, 10),
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 5, color: Colors.white),
                color: Colors.lightBlue,
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
                size: 80,
                color: Colors.grey.shade300,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
             Text(
              user.fullName,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Card(
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              ...ListTile.divideTiles(
                                color: Colors.grey,
                                tiles: [
                                   ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    leading: Icon(Icons.person),
                                    subtitle: Text(
                                        "hay ${user.username} welcome to ZiCare. have fun"),
                                  ),
                                  const ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    leading: Icon(Icons.my_location),
                                    title: Text("Surabaya, Indonesia"),
                                  ),
                                   ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    leading: Icon(Icons.email),
                                    title: Text(user.email),
                                  ),
                                  const ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    leading: Icon(Icons.phone),
                                    title: Text("+62 82761827638"),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    ]),
  );
}

Widget detailProfileDummy(BuildContext context,) {
  return SingleChildScrollView(
    child: Stack(children: [
      Container(
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
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
      ),
      Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(25, 100, 25, 10),
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 5, color: Colors.white),
                color: Colors.lightBlue,
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
                size: 80,
                color: Colors.grey.shade300,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Mawar Merah Merona',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Card(
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              ...ListTile.divideTiles(
                                color: Colors.grey,
                                tiles: [
                                  const ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    leading: Icon(Icons.person),
                                    subtitle: Text(
                                        "you can say anything in this column bro. have fun"),
                                  ),
                                  const ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    leading: Icon(Icons.my_location),
                                    title: Text("Surabaya, Indonesia"),
                                  ),
                                  const ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    leading: Icon(Icons.email),
                                    title: Text("mawar@merahmerona.com"),
                                  ),
                                  const ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    leading: Icon(Icons.phone),
                                    title: Text("+62 82761827638"),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    ]),
  );
}