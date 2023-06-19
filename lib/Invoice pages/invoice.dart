import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale/Invoice_Controller/Invoice_controller.dart';
import 'invoice_widget.dart';

// class Invoice extends StatefulWidget {
//   const Invoice({super.key});

//   @override
//   State<Invoice> createState() => _InvoiceState();
// }

// class _InvoiceState extends State<Invoice> {

//   final InvoiceListsController = Get.put(INVController());

//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: (const Color.fromARGB(193, 255, 82, 82)),
//           title: const Text("Invoice",
//               style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold)),
//           actions: [
//             InkWell(
//               child: const Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Icon(Icons.filter_alt_outlined),
//               ),
//               onTap: () {
//                 // Navigator.push(
//                 //     context,
//                 //     MaterialPageRoute(
//                 //       builder: (context) => const MyHomePage(),
//                 //     ));
//               },
//             ),
//           ],
//         ),
//         body: ListView.builder(
//               itemCount:  InvoiceListsController.invoiceModel!=null? InvoiceListsController.invoiceModel!.result.length : 0,
//             itemBuilder: (BuildContext context, int index) {
//               return InkWell(
//                 child: invoice_widget(),
//                 onTap: () {
//                   // Navigator.push(
//                   //     context,
//                   //     MaterialPageRoute(
//                   //       builder: (context) => const Setting(),
//                   //     ));
//                 },
//               );
//             }));
//   }
// }

class Invoice extends StatefulWidget {
  const Invoice({Key? key}) : super(key: key);

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  final InvoiceListsController = Get.put(INVController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // App bar code
      ),
      body: Obx(
        () {
          if (InvoiceListsController.loading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (InvoiceListsController.invoiceModel != null) {
              // Display the invoice data using the invoiceModel
              return ListView.builder(
                itemCount: InvoiceListsController.invoiceModel!.result.length,
                itemBuilder: (BuildContext context, int index) {
               
                  //Result invoice = InvoiceListsController.invoiceModel!.result[index];
                  return Text(InvoiceListsController.invoiceModel!.result[index].name.toString());
                  // return InkWell(
                  //   child: invoice_widget(invoice: invoice.name.toString()),
                  //   onTap: () {
                  //     // Handle invoice item tap
                  //   },
                  // );
                },
              );
            } else {
              return Center(
                child: Text('No data available'),
              );
            }
          }
        },
      ),
    );
  }
}


/*
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:invoice/Controllers/Invoice_controller.dart';
// import 'package:invoice/Models/main_quotation.dart';

// class Invoice extends StatefulWidget {
//   const Invoice({super.key});

//   @override
//   State<Invoice> createState() => _InvoiceState();
// }

// class _InvoiceState extends State<Invoice> {
//   final InvoiceListsController = Get.put(INVController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: (const Color.fromARGB(193, 255, 82, 82)),
//           title: const Text("Invoice",
//               style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold)),
//           actions: [
//             InkWell(
//               child: const Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Icon(Icons.filter_alt_outlined),
//               ),
//               onTap: () {
//                 // Navigator.push(
//                 //     context,
//                 //     MaterialPageRoute(
//                 //       builder: (context) => const MyHomePage(),
//                 //     ));
//               },
//             ),
//           ],
//         ),
//         body: SafeArea(
//           child: ListView.builder(
//             itemCount: InvoiceListsController.invoiceModel!.result.length,
//             itemBuilder: (BuildContext context, index) {
//               // ignore: unnecessary_null_comparison
//               if (Result != null) {
//                 return InkWell(
//                   child: Text(InvoiceListsController
//                       .invoiceModel!.result[index].companyName
//                       .toString()),
//                   onTap: () {
//                     // Handle invoice item tap
//                   },
//                 );
//               } else {
//                 return CircularProgressIndicator(); // or any other widget to indicate loading or handle the null case
//               }
//             },
//           ),
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice/Controllers/Invoice_controller.dart';


class Invoice extends StatefulWidget {
  const Invoice({Key? key}) : super(key: key);

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  final INVController invoiceController = Get.put(INVController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(193, 255, 82, 82),
        title: const Text(
          "Invoice",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          InkWell(
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(Icons.filter_alt_outlined),
            ),
            onTap: () {
              // Navigate to filter page
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(
          () {
            if (invoiceController.loading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final invoiceModel = invoiceController.invoiceModel;
              if (invoiceModel != null && invoiceModel.result.isNotEmpty) {
                return ListView.builder(
                  itemCount: invoiceModel.result.length,
                  itemBuilder: (BuildContext context, int index) {
                   // final result = invoiceModel.result[index];
                    return InkWell(
                      onTap: () {
                        // Handle invoice item tap
                      },
                      child: Text(invoiceModel.result.toString()),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text('No data available.'),
                );
              }
            }
          },
        ),
      ),
    );
  }
}

*/
/*import 'package:flutter/material.dart';
import 'package:sale/Model_class/sales_user_model_class.dart';
import '../Navigation Bar/navigation_ber.dart';
import '../Search___Filter/filter.dart';
import 'invoice_widget.dart';

class Invoice extends StatefulWidget {
  const Invoice({super.key});

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: (const Color.fromARGB(193, 255, 82, 82)),
        title: const Text("Invoice",
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        actions: [
          InkWell(
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(Icons.filter_alt_outlined),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ));
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: DataModel.items.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: invoice_widget(),
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const Setting(),
                //     ));
              },
            );
          }),
          
    );
  }
}
*/