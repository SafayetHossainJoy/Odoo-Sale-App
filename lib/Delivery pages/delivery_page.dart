import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../Delivery_controller/deliverycontroller.dart';
import '../Search___Filter/filter.dart';
import 'delivery_widget copy.dart';

class Delivery extends StatefulWidget {
  const Delivery({super.key});

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  final data = Get.put(DeliveryController());
  String formatDate(DateTime? dateTime) {
    return DateFormat('MM/dd/yyyy').format(dateTime!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: (const Color.fromARGB(193, 255, 82, 82)),
        title: const Text("Delivery",
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
      body: Obx(
        () {
          if (data.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (data.deliveryData != null) {
              // Display the invoice data using the invoiceModel
              return ListView.builder(
                itemCount: data.deliveryData?.result?.length,
                itemBuilder: (BuildContext context, index) {
                  //Result invoice = InvoiceListsController.invoiceModel!.result[index];
                  return delivery_widget(
                    address: data.deliveryData!.result![index].deliveryAddress
                        .toString(),
                    origin: data.deliveryData!.result![index].origin.toString(),
                    date: formatDate(
                        data.deliveryData!.result![index].scheduledDate),
                    status: data.deliveryData!.result![index].status.toString(),
                    item: data.deliveryData!.result![index]
                        .moveIdsWithoutPackage![0].productUomQty
                        .toString(),
                    name: data.deliveryData!.result![index].name
                        .toString()
                        .toString(),
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
    );
  }
}
