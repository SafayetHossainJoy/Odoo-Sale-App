import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sale/widgets/band_color.dart';

import '../Delivery pages/delivery_page.dart';
import '../Invoice pages/invoice.dart';
import '../Sales pages/sales_page.dart';
import '../Setting pages/setting.dart';

class Navigation_bar extends StatefulWidget {
  const Navigation_bar({super.key});

  @override
  State<Navigation_bar> createState() => _Navigation_barState();
}

class _Navigation_barState extends State<Navigation_bar> {
  List pages = [
    const sales(),
    const Invoice(),
    const Delivery(),
    const Setting()
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  onBackPressed() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13.0)),
            title: Text(
              "Are You Sure ?",
              style: myStyle(16, Colors.white, FontWeight.w500),
            ),
            content: const Text("You are going to exit the app !"),
            titlePadding:
                const EdgeInsets.only(top: 30, bottom: 12, right: 30, left: 30),
            contentPadding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            backgroundColor: BrandColors.colorPrimaryDark,
            contentTextStyle: myStyle(
                14, BrandColors.colorText.withOpacity(0.7), FontWeight.w400),
            titleTextStyle: myStyle(18, Colors.white, FontWeight.w500),
            actionsPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            actions: <Widget>[
              MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    "No",
                    style: myStyle(14, BrandColors.colorText),
                  )),
              MaterialButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                color: BrandColors.colorPurple,
                child: Text(
                  'Yes',
                  style: myStyle(14, Colors.white, FontWeight.w500),
                ),
                onPressed: () {
                  exit(0);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return onBackPressed();
        },
        child: Container(child: pages[currentIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.shifting,
          onTap: onTap,
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.insights_outlined,
                  color: Color.fromARGB(255, 5, 241, 13),
                ),
                label: "Sales"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.insert_drive_file_outlined,
                  color: Color.fromARGB(255, 58, 7, 241),
                ),
                label: "Invoice"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.delivery_dining,
                  color: Color.fromARGB(255, 250, 21, 5),
                ),
                label: "Delivery"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Color.fromARGB(255, 61, 60, 60),
                ),
                label: "Settings")
          ]),
    );
  }
}
