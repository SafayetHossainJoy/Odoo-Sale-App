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

import '../Partner_Models/PartnerModel.dart';
import '../Sales Models/saleQ_model.dart';

class SaleQuotationController extends GetxController {
  SalesquotModel? salesquot;
  UserModel? userModel;
  int value = 0;
  RxBool isLoading = false.obs;
  List<String> customerName = [];
  List<String> productName = [];

  List<double> unitPrice = [];

  List<int> productId = [];
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

    update();
  }

  void fetchProductData() async {
    try {
      isLoading.value = true;
      var headersList = {'Content-Type': 'application/json'};
      var url = Uri.parse('http://testii.xsellencebdltd.com/api/v1/products');

      var body = {};

      var req = http.Request('GET', url);
      req.headers.addAll(headersList);
      req.body = json.encode(body);

      var res = await req.send();
      final resBody = await res.stream.bytesToString();

      if (res.statusCode >= 200 && res.statusCode < 300) {
        final decodedResponse = json.decode(resBody);
        for (var elements in decodedResponse['result']) {
          productName.add(elements['name']);

          productId.add(elements['product_product_id']);
          unitPrice.add(elements['list_price']);
          isLoading.value = false;
        }
      } else {
        print(res.reasonPhrase);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  int getValueAtIndex(List<int> list, int index) {
    if (index >= 0 && index < list.length) {
      return list[index];
    } else {
      throw RangeError('Invalid index');
    }
  }

  double getUnitPriceAtIndex(List<double> list, int index) {
    if (index >= 0 && index < list.length) {
      return list[index];
    } else {
      throw RangeError('Invalid index');
    }
  }

  @override
  void onInit() {
    fetchProductData();
    fetchsalesquot();

    // fetchPartnerData();
    super.onInit();
  }

  // partner drapdown

  // void fetchPartnerData() async {
  //   try {
  //     isLoading.value = true;
  //     var headersList = {'Content-Type': 'application/json'};
  //     var url = Uri.parse('http://testii.xsellencebdltd.com/api/v1/products');

  //     var body = {};

  //     var req = http.Request('GET', url);
  //     req.headers.addAll(headersList);
  //     req.body = json.encode(body);

  //     var res = await req.send();
  //     final resBody = await res.stream.bytesToString();

  //     if (res.statusCode >= 200 && res.statusCode < 300) {
  //       final decodedResponse = json.decode(resBody);
  //       for (var elements in decodedResponse['result']) {
  //         customerName.add(elements['name']);
  //         print(customerName);
  //         isLoading.value = false;
  //       }
  //     } else {
  //       print(res.reasonPhrase);
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }
}
