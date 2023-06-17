import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

import '../../Sales pages/sales_page.dart';


// ignore: camel_case_types
class Contact_Us extends StatefulWidget {
  const Contact_Us({Key? key}) : super(key: key);

  @override
  State<Contact_Us> createState() => _Contact_UsState();
}

// ignore: camel_case_types
class _Contact_UsState extends State<Contact_Us> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ContactUsBottomAppBar(
        companyName: 'Xsellence Bangladesh Limited',
        textColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 209, 91, 82),
        email: 'info@xsellencebdltd.com',
        // textFont: 'Sail',
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 209, 91, 82),
        leading: InkWell(
            onTap: () {
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const sales(),
                  ));
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        title: const Text(
          "Contact Us",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ContactUs(
        cardColor: Colors.white,
        textColor: Colors.redAccent,
        logo: const AssetImage("assets/images/Trivozlogo.jpg"),
        email: 'contact@trivoz.com.bd',
        companyName: 'Trivoz',
        companyColor: Colors.redAccent,
        dividerThickness: 2,
        dividerColor: Colors.redAccent,
        website: "https://www.trivoz.com.bd/#attr=",
        phoneNumber: '09678221086',
        tagLine: 'Great products for great people',
        taglineColor: const Color.fromARGB(255, 226, 96, 87),
        facebookHandle: "https://www.facebook.com/trivozbd/",
      ),
    );
  }
}
