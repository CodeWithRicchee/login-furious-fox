import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_login/helper.dart';
import 'package:simple_login/providers/auth_providers.dart';
import 'package:simple_login/theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? userName;
  @override
  void initState() {
    getEmail();
    super.initState();
  }

  getEmail() async {
    await Helper.getUserEmailSharedPreference().then((value) {
      Provider.of<AuthProvider>(context, listen: false).getUserName(
        value!,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, user, _) {
      return Scaffold(
        backgroundColor: const Color(0xff121212),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Furious Fox",
            style: titleStyle.copyWith(
                letterSpacing: 2, fontSize: 20, color: Colors.greenAccent),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout_rounded),
              onPressed: () {
                Helper.saveUserLoggedInSharedPreference(false);
                Navigator.pushReplacementNamed(context, "/login");
              },
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 80),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              ),
              boxShadow: boxShadows,
              color: Colors.white),
          child: Center(
              child: Stack(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Lottie.network(
                'https://assets10.lottiefiles.com/packages/lf20_dwm2hi59.json',
              ),
              Column(
                children: [
                  Lottie.asset(
                    'assets/animations/75705-welcome-animation.json',
                  ),
                  Text(
                    "Welcome Back,",
                    style: titleStyle.copyWith(color: Colors.red, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/chart");
                    },
                    child: Text(
                      user.email ?? "",
                      style: titleStyle.copyWith(
                          fontSize: 20, color: Colors.black),
                    ),
                  ),
                ],
              )
            ],
          )),
        ),
      );
    });
  }
}
