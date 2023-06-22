// import 'dart:convert';

// import 'package:get/get.dart';

// import 'package:http/http.dart' as http;

// import '../Sales Models/saleQ_model.dart';

// class SaleQuotationController extends GetxController {
//   RxBool loading = false.obs;
//   SalesquotModel? salesquotModel;

//   @override
//   void onInit() {
//     super.onInit();
//     getSaleQuotationApi();
//   }

//   void getSaleQuotationApi() async {
//     var headers = {
//       'Content-Type': 'application/json',
//     };
//     var request = http.Request(
//         'GET', Uri.parse('http://testii.xsellencebdltd.com/api/v1/sales'));
//     request.body = json.encode({});
//     request.headers.addAll(headers);

//     http.StreamedResponse response = await request.send();

//     if (response.statusCode == 200) {
//       print(await response.stream.bytesToString());
//     } else {
//       print(response.reasonPhrase);
//     }
//   }
// }

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Sales Models/saleQ_model.dart';

class SaleQuotationController extends GetxController {
  SalesquotModel? salesquot;
  RxBool isLoading = false.obs;

  void fetchsalesquot() async {
    try {
      isLoading.value = true;
      var headersList = {'Content-Type': 'application/json'};
      var url = Uri.parse('http://testii.xsellencebdltd.com/api/v1/sales');

      var body = {};

      var req = http.Request('GET', url);
      req.headers.addAll(headersList);
      req.body = json.encode(body);

      var res = await req.send();
      final resBody = await res.stream.bytesToString();

      if (res.statusCode >= 200 && res.statusCode < 300) {
        final decodedResponse = json.decode(resBody);
        salesquot =
            SalesquotModel.fromJson(decodedResponse as Map<String, dynamic>);
        print(resBody);
      } else {
        print(res.reasonPhrase);
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    fetchsalesquot();
    super.onInit();
  }
}
