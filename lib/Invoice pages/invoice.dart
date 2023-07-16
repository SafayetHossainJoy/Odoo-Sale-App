// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:sale/Invoice_Controller/Invoice_controller.dart';
// import 'package:sale/Search___Filter/filter.dart';
// import 'Invoice_details_page.dart';
// import 'invoice_widget.dart';

// class Invoice extends StatefulWidget {
//   const Invoice({Key? key}) : super(key: key);

//   @override
//   State<Invoice> createState() => _InvoiceState();
// }

// class _InvoiceState extends State<Invoice> {
//   final data = Get.put(InvoiceController());
//   String formatDate(DateTime dateTime) {
//     return DateFormat('yyyy-MM-dd').format(dateTime);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: const Color.fromARGB(193, 255, 82, 82),
//         title: const Text(
//           "Invoice",
//           style: TextStyle(
//             fontSize: 20,
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         actions: [
//           InkWell(
//             child: const Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Icon(Icons.filter_alt_outlined),
//             ),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const MyHomePage(),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       body: RefreshIndicator(
//         onRefresh: _refresh,
//         child: Obx(
//           () {
//             if (data.isLoading.value) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else {
//               if (data.invoices != null) {
//                 return ListView.builder(
//                   itemCount: data.invoices!.result!.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     final invoice = data.invoices!.result![index];
//                     return GestureDetector(
//                       onTap: () {
//                         // Navigate to the InvoiceDetails page and pass the data
//                         Get.to(InvoiceDetails(
//                           invoiceName: invoice.name.toString(),
//                           companyName: invoice.companyName.toString(),
//                           invoiceOrigin: invoice.invoiceOrigin.toString(),
//                           state: invoice.state.toString(),
//                           price: invoice.amountTotal.toString(),
//                           date: invoice.invoiceDate.toString(),
//                         ));
//                       },
//                       child: InvoicWidget(
//                         price: invoice.amountTotal.toString(),
//                         state: invoice.state.toString(),
//                         companyName: invoice.companyName.toString(),
//                         invoiceOrigin: invoice.invoiceOrigin.toString(),
//                         date: invoice.invoiceDate.toString(),
//                         name: invoice.name.toString(),
//                       ),
//                     );
//                   },
//                 );
//               } else {
//                 return const Center(
//                   child: Text('No data available'),
//                 );
//               }
//             }
//           },
//         ),
//       ),
//     );
//   }

//   Future<void> _refresh() async {
//     data.fetchInvoices();
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sale/Invoice_Controller/Invoice_controller.dart';
import 'package:sale/Search___Filter/filter.dart';
import 'Invoice_details_page.dart';
import 'invoice_widget.dart';

class Invoice extends StatefulWidget {
  const Invoice({Key? key}) : super(key: key);

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  final data = Get.put(InvoiceController());

  String formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyHomePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Obx(
          () {
            if (data.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (data.invoices != null) {
                // Display the invoice data using the invoiceModel
                return ListView.builder(
                  itemCount: data.invoices!.result!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      child: InvoicWidget(
                        price: data.invoices!.result![index].amountTotal.toString(),
                        state: data.invoices!.result![index].state.toString(),
                        customerName: data.invoices!.result![index].customerName.toString(),
                        invoiceOrigin: data.invoices!.result![index].invoiceOrigin.toString(),
                        date: data.invoices!.result![index].invoiceDate,
                        name: data.invoices!.result![index].name.toString(),
                      ),
                      onTap: () {
                        // Navigate to InvoiceDetailsPage and pass the invoice data
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InvoiceDetailsPage(
                              customerName: data.invoices!.result![index].customerName.toString(), 
                              date: data.invoices!.result![index].invoiceDate,
                              name: data.invoices!.result![index].name.toString(), 
                              price: data.invoices!.result![index].amountTotal.toString(),
                              state: data.invoices!.result![index].state.toString(), 
                              stateAddress: data.invoices!.result![index].stateAddress.toString(),
                              productName: data.invoices!.result![index].lines![0].productName.toString(),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text('No data available'),
                );
              }
            }
          },
        ),
      ),
    );
  }

  Future<void> _refresh() async {
    data.fetchInvoices();
  }
}