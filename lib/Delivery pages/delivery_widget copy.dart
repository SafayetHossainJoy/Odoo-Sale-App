import 'package:flutter/material.dart';


class delivery_widget extends StatelessWidget {
  const delivery_widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 6),
      height: 120,
      width: double.maxFinite,
      child: Card(
        color: const Color.fromARGB(185, 255, 255, 255),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
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
                        allIcons(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50, // <-- SEE HERE
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 0),
                    child: Row(
                      children: <Widget>[
                        company(),
                        const Spacer(),
                        totalstatus(),
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
        text: "WH/OUT/005",
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
      ),
    ),
  );
}

Widget allIcons() {
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

Widget company() {
  return Align(
    alignment: Alignment.bottomLeft,
    child: RichText(
      text: const TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: "\nABG(1110)\nSO008",
              style: TextStyle(
                color: Color.fromARGB(147, 0, 0, 0),
                fontSize: 15,
              )),
          TextSpan(
              text: "\n11/23/2022",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}

Widget totalstatus() {
  return Align(
    alignment: Alignment.bottomRight,
    child: RichText(
      text: const TextSpan(
        text: '\n     10 Items',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
        children: <TextSpan>[
          TextSpan(
              text: '\n           Done',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}
