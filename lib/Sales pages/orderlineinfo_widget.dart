import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class orderlineinfo_widget extends StatelessWidget {
  const orderlineinfo_widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 100,
      width: double.maxFinite,
      child: Card(
        color: const Color.fromARGB(185, 255, 255, 255),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Stack(children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 0),
                    child: Row(
                      children: <Widget>[
                        salesorder(),
                        const Spacer(),
                        Totalstatus(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25, // <-- SEE HERE
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 0),
                    child: Row(
                      children: <Widget>[
                        company(),
                      ],
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

Widget salesorder() {
  return Align(
    alignment: Alignment.topLeft,
    child: FutureBuilder<String>(
      future: getProductFromSharedPreferences('productName'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While waiting for the data, show a loading indicator
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // If an error occurred while fetching the data, display an error message
          return Text('Error: ${snapshot.error}');
        } else {
          // If the data is available, display the product name
          final productName = snapshot.data ?? '';

          return RichText(
            text: TextSpan(
              text: productName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          );
        }
      },
    ),
  );
}

Future<String> getProductFromSharedPreferences(String storeName) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final data = prefs.getString(storeName) ?? '';
  return data;
}

Widget Totalstatus() {
  return FutureBuilder<String>(
    future: getProductFromSharedPreferences('subtotal'),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        // Data is retrieved successfully from SharedPreferences
        final subtotal = snapshot.data!;

        return Align(
          alignment: Alignment.bottomRight,
          child: RichText(
            text: TextSpan(
              text: '\n$subtotal BDT',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (snapshot.hasError) {
        // Error occurred while retrieving data from SharedPreferences
        return Text('Error: ${snapshot.error}');
      } else {
        // Data is still being loaded
        return CircularProgressIndicator();
      }
    },
  );
}

Widget company() {
  return FutureBuilder<Map<String, dynamic>>(
    future: getDataFromSharedPreferences(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        // Data is retrieved successfully from SharedPreferences
        final data = snapshot.data!;
        final quantity = data['quantity'];
        final unitPrice = data['unitPrice'];

        return Align(
          alignment: Alignment.bottomLeft,
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '\nQuantity: $quantity units',
                  style: TextStyle(
                    color: Color.fromARGB(147, 0, 0, 0),
                    fontSize: 15,
                  ),
                ),
                TextSpan(
                  text: '\nUnit Price: $unitPrice',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (snapshot.hasError) {
        // Error occurred while retrieving data from SharedPreferences
        return Text('Error: ${snapshot.error}');
      } else {
        // Data is still being loaded
        return CircularProgressIndicator();
      }
    },
  );
}

Future<Map<String, dynamic>> getDataFromSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  final quantity = prefs.getString('quantity') ?? '0.00';
  final unitPrice = prefs.getString('unitPrice') ?? '0.00';

  return {
    'quantity': quantity,
    'unitPrice': unitPrice,
  };
}
