import 'package:flutter/material.dart';

class InvoiceDetailsPage extends StatelessWidget {
  final String name;
  final String customerName;
  final String stateAddress;
  final String state;
  final String price;
  final String date;
  final String productName;
  final double? productQty;
  final double? priceUnit;
  final double? priceSubtotal;


  InvoiceDetailsPage({
    required this.name,
    required this.customerName,
    required this.stateAddress,
    required this.state,
    required this.price,
    required this.date,
    required this.productName,
    this.productQty,
    this.priceUnit,
    this.priceSubtotal
  });

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
          width: 400, // Set the desired width here
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
        
        SizedBox(height: 350),
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
  }
}


/*   const SizedBox(height: 8.0),
                Text(
                  'Price:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  Text('$price BDT'),
                ),*/
      //Column(
      //   children: [
      //     Text('Invoice Name: $name'),
      //     Text('Customer Name: $customerName'),
      //     Text('Customer Address: $stateAddress'),
      //     Text('State: $state'),
      //     Text('Price: $price'),
      //     Text('Date: $date'),
      //   ],
      //),