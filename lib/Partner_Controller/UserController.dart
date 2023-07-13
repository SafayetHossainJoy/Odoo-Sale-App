import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sale/Partner_Models/PartnerModel.dart';

class UserController extends GetxController {
  var users = <UserModel>[].obs;
  TextEditingController partnerIdtext = TextEditingController();
  TextEditingController nametext = TextEditingController();
  TextEditingController citytext = TextEditingController();
  TextEditingController streettext = TextEditingController();
  TextEditingController street2text = TextEditingController();
  TextEditingController emailtext = TextEditingController();
  TextEditingController phonetext = TextEditingController();
  TextEditingController mobiletext = TextEditingController();
  TextEditingController functiontext = TextEditingController();
  TextEditingController messagetext = TextEditingController();
  TextEditingController websitetext = TextEditingController();
  TextEditingController codetext = TextEditingController();

  saveuser() async {
    Uri url = Uri.parse(baseurl);

    try {
      var res = await http.post(url,
          body: jsonEncode({
            "params": {
              "name": nametext.text,
              "mobile": mobiletext.text,
              "email": emailtext.text,
              "company_id": 1,
              "street": streettext.text,
              "street2": street2text.text,
              "city": citytext.text,
              "zip": codetext.text,
              "country_id": 19,
              "function": functiontext.text,
              "website": websitetext.text
            }
          }),
          headers: {"content-type": "application/json"});
      if (res.statusCode == 200) {
        // Get.snackbar("post", "Successfully");
        debugPrint(res.statusCode.toString());
        debugPrint(res.body.toString());
      }
    } catch (e) {
      // Get.snackbar("error", "$e");
      debugPrint("error $e");
    }
  }

}

String baseurl = "http://testii.xsellencebdltd.com/api/v1/partners";
