import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sale/Navigation%20Bar/navigation_ber.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Login screen/login.dart';

// ignore: camel_case_types
class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

// ignore: camel_case_types
class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    // ignore: todo
    // TODO: implement initState
    Timer(const Duration(seconds: 3), () => isLogin());
  }

  isLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('cookie') != null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Navigation_bar()));
    } else {
      Navigator.push(
          context, CupertinoPageRoute(builder: (_) => const LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/Trivoz.png",
                height: 120,
              ),
              const Text(
                " Welcome to \n      Trivoz",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              const SpinKitSpinningLines(
                color: Colors.redAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
