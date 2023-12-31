import 'package:flutter/material.dart';


class SalesWidget extends StatelessWidget {
  final String name;
  final String customerName;
  final String companyName;
  final String date;
  final String state;
  final String price;
  const SalesWidget({
    Key? key,
    required this.name,
    required this.customerName,
    required this.companyName,
    required this.date,
    required this.state,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      height: 110,
      width: double.maxFinite,
      child: Card(
          color: const Color.fromARGB(185, 255, 255, 255),
          elevation: 1,
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
                  company(
                      customerName: customerName,
                      companyName: companyName,
                      date: date),
                  const Spacer(),
                  Totalstatus(state: state, price: price),
                ],
              ),
              // const SizedBox(
              //   height: 80, // <-- SEE HERE
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget salesorder({required String name}) {
  return Align(
    alignment: Alignment.centerRight,
    child: RichText(
      text: TextSpan(
        text: name,
      style: const TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18,),
      ),
      textAlign: TextAlign.start,
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
              height: 22,
              child: Image.asset(
                'assets/icons/sales.png',
                color: const Color.fromARGB(255, 95, 218, 99),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 8,
        ),
        Row(
          children: [
            SizedBox(
              height: 21,
              child: Image.asset(
                'assets/icons/invoice1.png',
                color: const Color.fromARGB(255, 122, 95, 218),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 8,
        ),
        Row(
          children: [
            SizedBox(
              height: 28,
              child: Image.asset(
                'assets/icons/delivery.png',
                color: const Color.fromARGB(255, 240, 68, 62),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget company({
  required String customerName,
  required String companyName,
  required String date,
}) {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerRight,
        child: Text(customerName,
           style: const TextStyle(
                color: Color.fromARGB(147, 0, 0, 0),
                fontSize: 16,
              ),
              textAlign: TextAlign.start,
              ),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: Text(companyName,
            style: const TextStyle(
              color: Color.fromARGB(147, 0, 0, 0),
              fontSize: 16,
            ),
            textAlign: TextAlign.start,
            ),
            
      ),
      Align(
        alignment: Alignment.centerRight,
        child: Text(
          date,
          style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
      ),

    ],
  );
}

Widget Totalstatus({required String price, required String state}) {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text('$price BDT',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Text(state,
          style: const TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),),
      ),
    ],
  );
}
