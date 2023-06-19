import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:sale/Invoice_Models/InvoiceModel.dart';

import '../Invoice_Models/main_quotation.dart';

class INVController extends GetxController {
  RxBool loading = false.obs;
  InvoiceModel? invoiceModel;
  List<Result> result = [];

  @override
  void onInit() {
    super.onInit();
    getUserinvoiceApi();
  }

  void getUserinvoiceApi() async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var request = http.Request(
        'POST', Uri.parse('http://testii.xsellencebdltd.com/api/v1/invoices/'));
    request.body = json.encode({
      "params": {
        "name": "INV/ASH-210/2023",
        "partner_id": 33,
        "account_id": 20,
        "products": [
          {
            "product_id": 28,
            "quantity": 2,
            "price_unit": 20,
            "price_subtotal": 40
          }
        ]
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    // if(response.statusCode == 200){
    //   print(request.body);
    // }

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
