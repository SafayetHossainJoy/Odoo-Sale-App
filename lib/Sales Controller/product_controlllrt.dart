import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  int id = 0;
  RxBool isLoading = false.obs;
  RxBool isLoadingCheck = false.obs;

  setLoading(RxBool value) {
    isLoadingCheck.value = value.value;
  }

  List<String> customerName = [];
  Future<void> postData() async {
    List<Map<String, dynamic>> dataList = await getListData();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var headersList = {
      'Content-Type': 'application/json',
      'Cookie': prefs.getString('cookie').toString()
      //'session_id=fd1bd949cb3165d1de13b97e43055cf08f552185'
    };
    var url = Uri.parse('http://testii.xsellencebdltd.com/api/v1/sales/');

    var body = {
      "params": {"products": dataList}
    };

    var req = http.Request('POST', url);
    req.headers.addAll(headersList);
    req.body = json.encode(body);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      final decodedResponse = json.decode(resBody);

      if (decodedResponse != null && decodedResponse['result'] != null) {
        // id = decodedResponse['result']['id'];
        id = decodedResponse['result']['id'];

        print('The id is $id');
        print('The cookie is ${prefs.getString('cookie').toString()}');
      } else {
        print('Invalid response structure');
      }

      print(resBody);

      // Store the received cookie
    } else {
      print(res.reasonPhrase);
    }
  }

  Future<void> checkout({required int id, required String name}) async {
    setLoading(true.obs);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': prefs.getString('cookie').toString()
      //'session_id=fd1bd949cb3165d1de13b97e43055cf08f552185'
    };
    var request = http.Request('POST',
        Uri.parse('http://testii.xsellencebdltd.com/api/v1/check-out/107'));
    request.body = json.encode({
      "params": {"name": name}
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      setLoading(false.obs);
    } else {
      print(response.reasonPhrase);
    }

    update();
  }

  Future<List<Map<String, dynamic>>> getListData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve the encoded list from SharedPreferences
    List<String>? encodedList = prefs.getStringList('a');

    // Decode the list of strings back into a list of maps
    List<Map<String, dynamic>> dataList = encodedList?.map((str) {
          Map<String, dynamic> map = jsonDecode(str);

          // Transform the map to the desired format
          Map<String, dynamic> transformedMap = {
            "product_id": map['id'],
            "product_uom_qty": int.parse(map['quantity']),
            "unit_price": double.parse(map['unitPrice']),
          };

          return transformedMap;
        }).toList() ??
        [];
    print(dataList);
    return dataList;
  }

  void fetchCustomerData() async {
    try {
      isLoading.value = true;
      var headersList = {'Content-Type': 'application/json'};
      var url = Uri.parse('http://testii.xsellencebdltd.com/api/v1/partners');

      var body = {};

      var req = http.Request('GET', url);
      req.headers.addAll(headersList);
      req.body = json.encode(body);

      var res = await req.send();
      final resBody = await res.stream.bytesToString();

      if (res.statusCode >= 200 && res.statusCode < 300) {
        final decodedResponse = json.decode(resBody);
        for (var elements in decodedResponse['result']) {
          customerName.add(elements['name']);
          isLoading.value = false;
        }
      } else {
        print(res.reasonPhrase);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void onInit() {
    fetchCustomerData();
    super.onInit();
  }
}
