import 'package:flutter/material.dart';
//import 'package:sale/All_in_one.dart';

import 'All_in_one.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: splash_screen(),
      // home: Navigation_bar(),
      home: HomePage(),
    );
  }
}
