import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showInToast(String value) {
  Fluttertoast.showToast(
      msg: value,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0);
}
