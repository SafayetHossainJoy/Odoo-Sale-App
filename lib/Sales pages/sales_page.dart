import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sale/Sales%20Controller/SQuotation_controller.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import '../Search___Filter/filter.dart';
import 'add_product.dart';
import '../Customer List/createnewcustomer.dart';
import 'sales_widget.dart';

class sales extends StatefulWidget {
  const sales({super.key});

  @override
  State<sales> createState() => _salesState();
}

class _salesState extends State<sales> {
  final data = Get.put(SaleQuotationController());
  String formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: (const Color.fromARGB(193, 255, 82, 82)),
          elevation: 10,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          leading: InkWell(
            child: const Icon(Icons.search_rounded),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ));
            },
          ),
          title: InkWell(
            child: const Text("Search"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ));
            },
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
                      builder: (context) => const MyHomePage(title: 'Filter'),
                    ));
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
                if (data.salesquot != null) {
                  // Display the invoice data using the invoiceModel
                  return ListView.builder(
                    itemCount: data.salesquot!.result.length,
                    itemBuilder: (BuildContext context, int index) {
                      //Result invoice = InvoiceListsController.invoiceModel!.result[index];
                      return SalesWidget(
                        state: data.salesquot!.result[index].state.name,
                        price: data.salesquot!.result[index].amountTotal
                            .toString(),
                        name: data.salesquot!.result[index].name,
                        customerName:
                            data.salesquot!.result[index].customerName,
                        companyName: data.salesquot!.result[index].companyName,
                        date:
                            formatDate(data.salesquot!.result[index].dateOrder),
                      );
                      // return InkWell(
                      //   child: invoice_widget(invoice: invoice.name.toString()),
                      //   onTap: () {
                      //     // Handle invoice item tap
                      //   },
                      // );
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


        floatingActionButton: SpeedDial(
            child: const Icon(Icons.add),
            openForegroundColor: Colors.redAccent,
            closedBackgroundColor: Colors.redAccent,
            openBackgroundColor: Colors.white,
            labelsBackgroundColor: Colors.redAccent,
            speedDialChildren: <SpeedDialChild>[
              SpeedDialChild(
                child: const Icon(Icons.person_add_alt_1_outlined),
                foregroundColor: Colors.black,
                backgroundColor: Colors.blue,
                label: 'Create New Customer',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewCustomer(),
                      ));
                },
              ),
              SpeedDialChild(
                child: const Icon(Icons.add_shopping_cart_outlined),
                foregroundColor: Colors.black,
                backgroundColor: Colors.blue,
                label: 'Create New Sales Order',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddProduct(),
                      ));
                },
              )
            ]));
  }

  Future<void> _refresh() async {
    data.fetchsalesquot();
  }
}
