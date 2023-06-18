import 'package:flutter/material.dart';

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
    child: RichText(
      text: const TextSpan(
        text: "Dell",
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
      ),
    ),
  );
}

Widget Totalstatus() {
  return Align(
    alignment: Alignment.bottomRight,
    child: RichText(
      text: const TextSpan(
        text: '\n100000 BDT',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
        children: <TextSpan>[
          TextSpan(
              text: '',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}

Widget company() {
  return Align(
    alignment: Alignment.bottomLeft,
    child: RichText(
      text: const TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: "\nQuantity: 2.00 units",
              style: TextStyle(
                color: Color.fromARGB(147, 0, 0, 0),
                fontSize: 15,
              )),
          TextSpan(
              text: "\nUnit Pric: 50000.00",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}
