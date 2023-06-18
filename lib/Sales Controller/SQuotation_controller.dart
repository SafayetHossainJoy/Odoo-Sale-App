import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../Sales Models/saleQ_model.dart';

class SaleQuotationController extends GetxController {
  RxBool loading = false.obs;
  SalesquotModel? salesquotModel;

  @override
  void onInit() {
    super.onInit();
    getSaleQuotationApi();
  }

  void getSaleQuotationApi() async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var request = http.Request(
        'GET', Uri.parse('http://testii.xsellencebdltd.com/api/v1/sales'));
    request.body = json.encode({});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
