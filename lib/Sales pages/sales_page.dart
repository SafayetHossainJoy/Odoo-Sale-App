import 'package:flutter/material.dart';
import 'package:sale/Model_class/sales_user_model_class.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import '../Search___Filter/filter.dart';
import 'add_product.dart';
import 'createnewcustomer.dart';
import 'sales_widget.dart';

class sales extends StatefulWidget {
  const sales({super.key});

  @override
  State<sales> createState() => _salesState();
}

class _salesState extends State<sales> {
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
        body: ListView.builder(
            itemCount: DataModel.items.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: const sales_widget(),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const OrderPage(),
                  //     ));
                },
              );
            }),
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
}
