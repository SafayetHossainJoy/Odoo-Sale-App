import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Delivery_models/delivery_model.dart';


class DeliveryController extends GetxController {
  DeliveryModel? deliveryData;
  RxBool isLoading = false.obs;

  void fetchDeliveryData() async {
    try {
      isLoading.value = true;
      var headersList = {'Content-Type': 'application/json'};
      var url = Uri.parse('http://testii.xsellencebdltd.com/api/v1/delivery');

      var body = {};

      var req = http.Request('GET', url);
      req.headers.addAll(headersList);
      req.body = json.encode(body);

      var res = await req.send();
      final resBody = await res.stream.bytesToString();

      if (res.statusCode >= 200 && res.statusCode < 300) {
        final decodedResponse = json.decode(resBody);
        deliveryData =
            DeliveryModel.fromJson(decodedResponse as Map<String, dynamic>);
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
    fetchDeliveryData();
    super.onInit();
  }
}
