import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Invoice_Controller/Invoice_controller.dart';
import 'invoiceLine_widgets.dart';

class InvoiceDetailsPage extends StatelessWidget {
  final String name;
  final String customerName;
  final String stateAddress;
  final String state;
  final String price;
  final String date;
  final String productName;
  // final double? productQty;
  // final double? priceUnit;
  // final double? priceSubtotal;

  InvoiceDetailsPage(
      {required this.name,
      required this.customerName,
      required this.stateAddress,
      required this.state,
      required this.price,
      required this.date,
      required this.productName,
      // this.productQty,
      // this.priceUnit,
      // this.priceSubtotal
      });
  final data = Get.put(InvoiceController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color.fromARGB(193, 255, 82, 82),
        centerTitle: true,
        title: const Text(
          "Invoice Details",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 400, 
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: $name',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Customer Name: $customerName',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Customer Address: $stateAddress',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'State: $state',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Date: $date',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 10, bottom: 0, top: 15, right: 100),
              child: Text(
                'Invoice Lines',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(height: 10),
            if (data.invoices != null)
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.invoices!.result![0].lines?.length,
                itemBuilder: (BuildContext context, index) {
                  return InvoiceLine_widgets(
                    productName: data
                        .invoices!.result![index].lines![0].productName
                        .toString(),
                    productQty: data
                        .invoices!.result![index].lines![0].productQty!
                        .toString(),
                    priceUnit: data
                        .invoices!.result![index].lines![0].priceUnit!
                        .toString(),
                    priceSubtotal: data
                        .invoices!.result![index].lines![0].priceSubtotal!
                        .toString(),
                  );
                  // Card(
                  //   elevation: 8,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(10.0),
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(10.0),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           'Product Name: ${lineItem.productName}',
                  //           style: TextStyle(
                  //             fontSize: 18,
                  //             fontWeight: FontWeight.normal,
                  //           ),
                  //         ),
                  //         const SizedBox(height: 8.0),
                  //         Text(
                  //           'Quantity: ${lineItem.productQty}',
                  //           style: TextStyle(
                  //             fontSize: 18,
                  //             fontWeight: FontWeight.normal,
                  //           ),
                  //         ),
                  //         const SizedBox(height: 8.0),
                  //         Text(
                  //           'Price Unit: ${lineItem.priceUnit}',
                  //           style: TextStyle(
                  //             fontSize: 18,
                  //             fontWeight: FontWeight.normal,
                  //           ),
                  //         ),
                  //         const SizedBox(height: 8.0),
                  //         Text(
                  //           'Price Subtotal: ${lineItem.priceSubtotal}',
                  //           style: TextStyle(
                  //             fontSize: 18,
                  //             fontWeight: FontWeight.normal,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // );
                },
              ),
            SizedBox(height: 150),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Total: $price',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


    // Scaffold(
    //   appBar: AppBar(
    //     automaticallyImplyLeading: true,
    //     backgroundColor: const Color.fromARGB(193, 255, 82, 82),
    //     centerTitle: true,
    //     title: const Text(
    //       "Invoice Details",
    //       style: TextStyle(
    //         fontSize: 20,
    //         color: Colors.white,
    //         fontWeight: FontWeight.bold,
    //       ),
    //     ),
    //   ),
    //   body: SingleChildScrollView(
    //     padding: const EdgeInsets.all(10.0),
    //     child: SizedBox(
    //       width: 400, // Set the desired width here
    //       child: Card(
    //         elevation: 8,
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(10.0),
    //         ),
    //         child: Padding(
    //           padding: const EdgeInsets.all(10.0),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 'Name: $name',
    //                 style: TextStyle(
    //                    fontSize: 18,
    //                   fontWeight: FontWeight.w900,
    //                 ),
    //               ),
    //               const SizedBox(height: 8.0),
    //               Text(
    //                 'Customer Name: $customerName',
    //                 style: TextStyle(
    //                    fontSize: 18,
    //                   fontWeight: FontWeight.normal,
    //                 ),
    //               ),
    //               const SizedBox(height: 8.0),
    //               Text(
    //                 'Customer Address: $stateAddress',
    //                 style: TextStyle(
    //                    fontSize: 18,
    //                   fontWeight: FontWeight.normal,
    //                 ),
    //               ),
    //               const SizedBox(height: 8.0),
    //               Text(
    //                 'State: $state',
    //                 style: TextStyle(
    //                    fontSize: 18,
    //                   fontWeight: FontWeight.normal,
    //                 ),
    //               ),
    //               const SizedBox(height: 8.0),
    //               Text(
    //                 'Date: $date',
    //                 style: TextStyle(
    //                    fontSize: 18,
    //                   fontWeight: FontWeight.normal,
    //                 ),
    //               ),

    //             ],
    //           ),
    //         ),
    //       ),

    //     ),

    //   ),
    // );