import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:sale/Model_class/sales_Orderlist.dart';


class sales_widget extends StatelessWidget {
  const sales_widget({
    Key? key,
  }) : super(key: key);

Future<SalesQuotation?> fetchSalesQuotation() async {
  final url = Uri.parse('http://testtrivoz.xsellencebdltd.com/api/v1/sales');
  final response = await http.post(url, body: '{"params":{"name": "S06607796"}}');
  if (response.statusCode == 200) {
    return salesQuotationFromJson(response.body);
  } else {
    throw Exception('Failed to fetch sales quotation');
  }
}
 /*   getSalesQuotationData() async {
    List<SalesQuotation> orderData = [];
    var response = await http.get(
        Uri.parse("http://testtrivoz.xsellencebdltd.com/api/v1/sales"),
        headers: await CustomHttpRequest().getHeaderWithToken());
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print("Order list are $data");
      print(response.body);
      for (var item in data) {}
    }
    return orderData;
  }*/
//   Future<SalesQuotation> fetchSalesQuotation() async {
//   final response = await http.get(Uri.parse('http://testtrivoz.xsellencebdltd.com/api/v1/sales'));
//   if (response.statusCode == 200) {
//     return SalesQuotation.fromJson(json.decode(response.body));
    
//   } else {
//     throw Exception('Failed to load sales quotation');
//   }
  
// }

/* 
   getSalesQuotationData() async {
    List<SalesQuotation> orderData = [];
    var response = await http.get(
        Uri.parse("http://testtrivoz.xsellencebdltd.com/api/v1/sales"),
       
        headers: {'Content-Type': 'application/json'},);
    if (response.statusCode == 200) {
      var data = json.encode({{"params":{"name": "S06607796"}}});
      print("Order list are $data");
      
      // for (var item in data) {}
    }
    print(response.body);
    return orderData;
  }
*/
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 6),
      height: 120,
      width: double.maxFinite,
      child: Card(
        color: const Color.fromARGB(185, 255, 255, 255),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 0),
                      child: Row(
                      children: <Widget>[
                        salesorder(),
                        const Spacer(),
                        AllIcons(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50, // <-- SEE HERE
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 0),
                    child: Row(
                      children: <Widget>[
                        company(),
                        const Spacer(),
                        Totalstatus(),
                      ],
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

Widget salesorder() {
  return Align(
    alignment: Alignment.topLeft,
    child: RichText(
      text: const TextSpan(
        text: "SO008",
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
      ),
    ),
  );
}

Widget AllIcons() {
  return Align(
    alignment: Alignment.topRight,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              height: 25,
              child: Image.asset(
                'assets/icons/sales.png',
                color: const Color.fromARGB(255, 95, 218, 99),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 8,
        ),
        Row(
          children: [
            SizedBox(
              height: 25,
              child: Image.asset(
                'assets/icons/invoice1.png',
                color: const Color.fromARGB(255, 122, 95, 218),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 8,
        ),
        Row(
          children: [
            SizedBox(
              height: 30,
              child: Image.asset(
                'assets/icons/delivery.png',
                color: const Color.fromARGB(255, 240, 68, 62),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget company() {
  return Align(
    alignment: Alignment.bottomLeft,
    child: RichText(
      text: const TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: "\nABG(1110)\nBashundhara",
              style: TextStyle(
                color: Color.fromARGB(147, 0, 0, 0),
                fontSize: 15,
              )),
          TextSpan(
              text: "\n11/23/2022",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}

Widget Totalstatus() {
  return Align(
    alignment: Alignment.bottomRight,
    child: RichText(
      text: const TextSpan(
        text: '\n1000000 BDT',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
        children: <TextSpan>[
          TextSpan(
              text: '\n      Pending',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}
