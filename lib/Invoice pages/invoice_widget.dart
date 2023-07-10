import 'package:flutter/material.dart';


class InvoicWidget extends StatelessWidget {
  final String name;
  final String companyName;
  final String invoiceOrigin;
  final String state;
  final String price;
  final String date;
  const InvoicWidget({
    Key? key,
    required this.name,
    required this.companyName,
    required this.invoiceOrigin,
    required this.state,
    required this.price,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 3),
        height: 120,
        width: double.maxFinite,
        child: Card(
          color: const Color.fromARGB(185, 255, 255, 255),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    salesorder(name: name),
                    const Spacer(),
                    AllIcons(),
                  ],
                ),
                Row(
                  children: <Widget>[
                    company(companyName: companyName,invoiceOrigin: invoiceOrigin, 
                    date: date 
                    ),
                    const Spacer(),
                    Totalstatus(state: state, price: price),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget salesorder({required String name}) {
  return RichText(
    
    text: TextSpan(
      text: name,
      style: const TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20,),
    ),
  );
}

Widget AllIcons() {
  return Align(
    alignment: Alignment.topRight,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              height: 30,
              child: Image.asset(
                'assets/icons/invoice1.png',
                color:  const Color.fromARGB(255, 122, 95, 218),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget company({required String companyName,required String invoiceOrigin,required String date }) {
  return Column(
    children: [
      Text(companyName,
          style: TextStyle(
            color: Color.fromARGB(147, 0, 0, 0),
            fontSize: 15,
          )),
          
        Text(invoiceOrigin,
          style: TextStyle(
                color: Color.fromARGB(147, 0, 0, 0),
                fontSize: 15,
              )),
      Text(date,
         style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
    ],
  );
}

Widget Totalstatus({required String price, required String state}) {
  return Column(
    children: [
      Text(
        '$price BDT',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
      ),
      Text(state,
          style: TextStyle(
              color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold)),
    ],
  );
}
