import 'package:flutter/material.dart';


class delivery_widget extends StatelessWidget {
  final String name;
  final String date;
  final String address;
  final String origin;
  final String status;
  final String item;

  const delivery_widget({
    Key? key,
    required this.name,
    required this.date,
    required this.address,
    required this.origin,
    required this.status,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
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
                  company(address: address, date: date, origin: origin),
                  const Spacer(),
                  Totalstatus(status: status, item: item),
                ],
              )
            ],
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
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
    ),
     textAlign: TextAlign.start,
  );
}

Widget AllIcons() {
  return Align(
    alignment: Alignment.topRight,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 8,
        ),
        Row(
          children: [
            SizedBox(
              height: 30,
              child: Image.asset(
                'assets/icons/delivery.png',
                color: Colors.green,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget company({
  required String date,
  required String address,
  required String origin,
}) {
  return Column(
    children: [
      Text(address,
         style: const TextStyle(
                color: Color.fromARGB(147, 0, 0, 0),
                fontSize: 16,
              )),
      Text(origin,
          style: const TextStyle(
                color: Color.fromARGB(147, 0, 0, 0),
                fontSize: 16,
              )),
      Text(date,
          style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold))
    ],
  );
}

Widget Totalstatus({
  required String item,
  required String status,
}) {
  return Column(
    children: [
      Text('$item Items',
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),),
      Text(status,
           style: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
    ],
  );
}
