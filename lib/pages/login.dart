import 'dart:math';

// import 'package:email_validator/email_validator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_login/helper.dart';
// import 'package:simple_login/helper.dart';
import 'package:simple_login/providers/auth_providers.dart';
import 'package:simple_login/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool onpressed = false;
  @override
  void initState() {
    onpressed = false; // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 5),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            boxShadow: shadows,
          ),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Login",
                    style: titleStyle.copyWith(
                      letterSpacing: 1.2,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: _emailController,
                  validator: (val) =>
                      EmailValidator.validate(val) ? null : "Enter valid email",
                  style: titleStyle,
                  cursorColor: Colors.white,
                  showCursor: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text(
                      "Email",
                      style: titleStyle.copyWith(fontSize: 15),
                    ),
                    hintText: "Enter your Email address",
                    prefixIcon: const Icon(
                      Icons.email_rounded,
                      color: Colors.redAccent,
                    ),
                    errorStyle: titleStyle.copyWith(
                        color: Colors.redAccent, fontSize: 10),
                    hintStyle: titleStyle.copyWith(
                        fontSize: 13, color: Colors.black45),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.red),
                        gapPadding: 4.0),
                    errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.red),
                        gapPadding: 4.0),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.blueAccent),
                        gapPadding: 4.0),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.black),
                        gapPadding: 10.0),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  validator: (val) => val!.isEmpty || val.length < 7
                      ? "Password mismatch || should be >= 7 chars"
                      : null,
                  style: titleStyle,
                  cursorColor: Colors.white,
                  showCursor: false,
                  // keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text(
                      "password",
                      style: titleStyle.copyWith(fontSize: 15),
                    ),
                    hintText: "Enter password",
                    prefixIcon: const Icon(
                      Icons.password,
                      color: Colors.blueAccent,
                    ),
                    errorStyle: titleStyle.copyWith(
                        color: Colors.redAccent, fontSize: 10),
                    hintStyle: titleStyle.copyWith(
                        fontSize: 13, color: Colors.black45),
                    errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.red),
                        gapPadding: 4.0),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.red),
                        gapPadding: 4.0),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.blueAccent),
                        gapPadding: 4.0),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.black),
                        gapPadding: 10.0),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        Provider.of<AuthProvider>(context, listen: false).logIn(
                            _emailController.text.toString(),
                            _passwordController.text.toString());

                        Helper.saveEmailSharedPreference(
                            _emailController.text.isEmpty
                                ? "World"
                                : _emailController.text.toString());
                        Helper.saveUserLoggedInSharedPreference(true);
                        setState(() {
                          onpressed = true;
                        });
                        await Future<void>.delayed(Duration(seconds: 2));

                        Navigator.pushReplacementNamed(context, "/home");
                      }
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 12),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            boxShadow: shadows,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          !onpressed ? "Login" : "Loading...",
                          style: titleStyle.copyWith(
                              color: Colors.black.withOpacity(0.7)),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
