import 'package:flutter/material.dart';

import '../../Sales pages/sales_page.dart';


class About_Us extends StatefulWidget {
  const About_Us({Key? key}) : super(key: key);

  @override
  State<About_Us> createState() => _About_UsState();
}

class _About_UsState extends State<About_Us> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: (Colors.redAccent),
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
          "About us",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      // backgroundColor: Colors.red.shade50,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Quality Products For All',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: Color.fromARGB(221, 20, 19, 19),
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: 280,
                  child: Image.asset(
                    "assets/images/wholesale-business.jpg",
                  ),
                  // Divider(
                  //   color: Colors.black,
                  //   height: 50,
                  // ),
                ),
                const Card(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: ListTile(
                    title: Text(
                      "Trivoz.com.bd. is a Business-to-Business (B2B) E-commerce website that provides one-stop purchasing solutions. We bring the best of products at the best value right to your business Place. Trivoz.com.bd wants to centralize all manufacturers, importers, suppliers, and resellers in digital platforms to wholesale and buy their products easily from their own place. It is one of the B2B online marketplaces in Bangladesh. ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const Card(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: ListTile(
                    title: Text(
                      "TRIVOZ.COM.BD is a B2B online wholesale market e-commerce website capable of providing every kind of goods from every sector to every importer, manufacturer & wholesaler to reseller located in Bangladesh. It is one of the B2B online marketplaces in Bangladesh. ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
