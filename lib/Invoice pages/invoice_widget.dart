import 'package:flutter/material.dart';


class invoice_widget extends StatelessWidget {
  const invoice_widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
                          AllIcons(),
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
                          Totalstatus(),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
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
        text: "INV008",
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
      ),
    ),
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
              height: 25,
              child: Image.asset(
                'assets/icons/invoice1.png',
                color: const Color.fromARGB(255, 122, 95, 218),
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

Widget Totalstatus() {
  return Align(
    alignment: Alignment.bottomRight,
    child: RichText(
      text: const TextSpan(
        text: '\n100,000 BDT',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
        children: <TextSpan>[
          TextSpan(
              text: '\n          Posted',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}
