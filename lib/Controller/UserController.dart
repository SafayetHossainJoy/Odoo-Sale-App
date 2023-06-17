// import 'dart:convert';
// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:sale/Controller/Models/UserModel.dart';

// class UserController extends GetxController{

//   var users = <UserModel>[].obs;
//   TextEditingController partnerIdtext = TextEditingController();
//   TextEditingController nametext = TextEditingController();
//   TextEditingController citytext = TextEditingController();
//   TextEditingController streettext = TextEditingController(); 
//   TextEditingController street2text = TextEditingController(); 
//   TextEditingController emailtext = TextEditingController();
//   TextEditingController phonetext = TextEditingController(); 
//   TextEditingController mobiletext = TextEditingController();
//   TextEditingController functiontext = TextEditingController();
//   TextEditingController messagetext = TextEditingController();
//   TextEditingController errortext = TextEditingController();
//   TextEditingController codetext = TextEditingController();

//   saveuser()async {  

//     Uri url = Uri.parse(baseurl);
//     //Uri.parse('http://testtrivoz.xsellencebdltd.com/api/v1/partners/');

//      // final userdata = UserModel(jsonrpc: '',
//      //  result: Result(
//      //  partnerId: int.parse(partnerIdtext.text),
//      //  name: nametext.text,
//      //  city: citytext.hasListeners,
//      //  street: streettext.hasListeners,
//      //  street2: street2text.hasListeners,
//      //  email: emailtext.text,
//      //  phone: phonetext.hasListeners,
//      //  mobile: mobiletext.text,
//      //  function: functiontext.hasListeners,
//      //  message: messagetext.text,
//      //  error: errortext.hasListeners,
//      //  code: int.parse(codetext.text)));


//     try{
//       var res = await http.post(url,
//           body: jsonEncode({"params": {
//             "name": nametext.text,
//             "mobile": mobiletext.text,
//             "email": emailtext.text
//           }}),
//           headers: {"content-type":"application/json"}
//           );
//     if(res.statusCode == 200){
//       // Get.snackbar("post", "Successfully");
//       debugPrint(res.statusCode.toString());
//       debugPrint(res.body.toString());
//     }
//     }catch(e){
//       // Get.snackbar("error", "$e");
//       debugPrint("error $e");
//     }
//   }

  

//   // getUser()async {
//   //   Uri url = Uri.parse("${baseurl}getUser");
//   //   try{
//   //     var res = await http.get(url);
//   //   var data = List<UserModel>.from(jsonDecode(res.body).map((e)=>UserModel.fromJson(e))).toString();
//   //   if(data!=null){
//   //     users.value = data as List<UserModel>;
//   //   }
//   //   }catch(e){
//   //       Get.snackbar("error", "$e");
//   //   }
//   // }
//   // @override
//   // void onInit() {
//   //  saveuser();
//   //  //getUser();
//   //   super.onInit();
//   // }
 
// }


// String baseurl = "http://testtrivoz.xsellencebdltd.com/api/v1/partners" ;

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sale/Controller/Models/UserModel.dart';

class UserController extends GetxController{

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
  TextEditingController errortext = TextEditingController();
  TextEditingController codetext = TextEditingController();

  saveuser()async {  

    Uri url = Uri.parse(baseurl);
    //Uri.parse('http://testtrivoz.xsellencebdltd.com/api/v1/partners/');

     // final userdata = UserModel(jsonrpc: '',
     //  result: Result(
     //  partnerId: int.parse(partnerIdtext.text),
     //  name: nametext.text,
     //  city: citytext.hasListeners,
     //  street: streettext.hasListeners,
     //  street2: street2text.hasListeners,
     //  email: emailtext.text,
     //  phone: phonetext.hasListeners,
     //  mobile: mobiletext.text,
     //  function: functiontext.hasListeners,
     //  message: messagetext.text,
     //  error: errortext.hasListeners,
     //  code: int.parse(codetext.text)));


    try{
      var res = await http.post(url,
          body: jsonEncode({"params": {
            "name": nametext.text,
            "mobile": "+8801932629230",
            "email": "safayet11534@gmail.com"
          }}),
          headers: {"content-type":"application/json"}
          );
    if(res.statusCode == 200){
      // Get.snackbar("post", "Successfully");
      debugPrint(res.statusCode.toString());
      debugPrint(res.body.toString());
    }
    }catch(e){
      // Get.snackbar("error", "$e");
      debugPrint("error $e");
    }
  }

  

  // getUser()async {
  //   Uri url = Uri.parse("${baseurl}getUser");
  //   try{
  //     var res = await http.get(url);
  //   var data = List<UserModel>.from(jsonDecode(res.body).map((e)=>UserModel.fromJson(e))).toString();
  //   if(data!=null){
  //     users.value = data as List<UserModel>;
  //   }
  //   }catch(e){
  //       Get.snackbar("error", "$e");
  //   }
  // }
  // @override
  // void onInit() {
  //  saveuser();
  //  //getUser();
  //   super.onInit();
  // }
 
}


String baseurl = "http://testtrivoz.xsellencebdltd.com/api/v1/partners" ;