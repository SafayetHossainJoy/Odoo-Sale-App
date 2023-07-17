import 'package:flutter/material.dart';

class InvoiceLine_widgets extends StatelessWidget {
  final String productName;
  final dynamic productQty;
  final dynamic priceUnit;
  final dynamic priceSubtotal;

  const InvoiceLine_widgets({super.key, required this.productName, required this.productQty, required this.priceUnit, required this.priceSubtotal});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        height: 85,
        width: double.maxFinite,
        child: Card(
          color: const Color.fromARGB(185, 255, 255, 255),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
               
                Row(
                  children: <Widget>[
                    ProductLine(productName: productName, productQty: productQty, 
                    priceUnit: priceUnit 
                    ),
                    const Spacer(),
                    Totals( priceSubtotal: priceSubtotal, ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


Widget ProductLine({required String productName, required productQty,required  priceUnit,  }) {
  return Column(
    children: [
      Text(productName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          )),
          
        Text(productQty,
          style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              )),
      Text(priceUnit,
         style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
    ],
  );
}

Widget Totals({required  priceSubtotal,}) {
  return Column(
    children: [
      Text(
        '$priceSubtotal BDT',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
      ),

    ],
  );
}
