import 'package:flutter/material.dart';

import 'Orderline.dart';

class DrapdownOrder extends StatefulWidget {
  const DrapdownOrder({super.key});

  @override
  State<DrapdownOrder> createState() => _DrapdownOrderState();
}

class _DrapdownOrderState extends State<DrapdownOrder> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: (const Color.fromARGB(193, 255, 82, 82)),
        title: const Text("Create Order Lines",
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        actions: [
          InkWell(
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(Icons.credit_card),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductInfo(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}