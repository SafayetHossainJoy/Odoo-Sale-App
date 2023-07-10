import 'dart:convert';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:sale/widgets/custom_TextField.dart';
import 'package:sale/widgets/widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Navigation Bar/navigation_ber.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool hidePassword = true;
  String loginLink =
      "http://testii.xsellencebdltd.com/web/session/authenticate";

  // check use is login or not if login then goto next page and save user data and one time login

  Future<void> login({required String email, required String password}) async {
    islogin = true;

    var headers = {
      'Content-Type': 'application/json',
    };
    var request = http.Request('POST',
        Uri.parse('http://testii.xsellencebdltd.com/web/session/authenticate'));
    request.body = json.encode({
      "jsonrpc": "2.0",
      "params": {"db": "testii", "login": email, "password": password}
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseString = await response.stream.bytesToString();
      print(responseString);

      var responseData = json.decode(responseString);
      var result = responseData['result'];

      var cookies = response.headers['set-cookie'];
      String? sessionID;
      if (cookies != null) {
        var cookieParts =
            cookies.split(';'); // Split the cookie string into individual parts
        for (var part in cookieParts) {
          if (part.trim().startsWith('session_id=')) {
            sessionID = part.trim().substring('session_id='.length);
            break;
          }
        }
      }

// Store the session ID

      if (result['id'] != 0 && sessionID != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('cookie', 'session_id=$sessionID').then((value) =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const Navigation_bar())));
      } else {
        showInToast('Invalid Input');
      }
    } else {
      print(response.reasonPhrase);
    }
  }

  String? token;

  bool islogin = false;
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              height: 300,
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(90)),
                color: Colors.redAccent,
                gradient: LinearGradient(
                  colors: [
                    (Color.fromARGB(255, 237, 79, 79)),
                    Color.fromARGB(255, 245, 225, 225)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: Image.asset(
                      "assets/images/Trivoz.png",
                      height: 150,
                      width: 150,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20, top: 20),
                    alignment: Alignment.bottomRight,
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            controller: loginController,
            hintText: "Enter your Email",
            prefixIcon: const Icon(Icons.email),
            validatorFn: (value) {
              (input) =>
                  !input.contains('@') ? "Email Id should be valid" : null;
              return null;
            },
          ),
          CustomTextField(
            controller: passwordController,
            hintText: "Enter your password",
            prefixIcon: const Icon(Icons.vpn_key),
            validatorFn: (value) {
              return null;
            },
            obscureText: hidePassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              color: Colors.black,
              icon:
                  Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
            ),
          ),
          InkWell(
            onTap: () {
              if (loginController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty) {
                login(
                    email: loginController.text.trim(),
                    password: passwordController.text);
              } else {
                showInToast('all required filled');
              }
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Colors.redAccent,
                  Color.fromARGB(255, 250, 236, 236)
                ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              child: islogin
                  ? CircularProgressIndicator()
                  : const Text(
                      "LOGIN",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
            ),
          ),
        ]),
      ),
    );
  }
}
