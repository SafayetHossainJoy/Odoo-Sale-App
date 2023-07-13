import 'package:flutter/material.dart';


class Customer_widget extends StatelessWidget {
  final String name;
  // final String companyName;
  // final String email;
  // final String mobile;
 
  const Customer_widget({
    Key? key,
    required this.name,
    // required this.companyName,
    // required this.email,
    // required this.mobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
                    Customer(name: name),
                    // const Spacer(),
                    // AllIcons(),
                  ],
                ),
                Row(
                  children: <Widget>[
                    // company(companyName: companyName, email: email, mobile: mobile,
                    // ),
                    // const Spacer(),
                    // Totalstatus(state: state, price: price),
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

Widget Customer({required String name}) {
  return RichText(
    
    text: TextSpan(
      text: name,
      style: const TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18,),
    ),
  );
}

// Widget AllIcons() {
//   return Align(
//     alignment: Alignment.topRight,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Row(
//           children: [
//             SizedBox(
//               height: 22,
//               child: Image.asset(
//                 'assets/icons/invoice1.png',
//                 color:  const Color.fromARGB(255, 122, 95, 218),
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }

// Widget company({required String companyName,required String email, required String mobile}) {
//   return Column(
//     children: [
//       Text(companyName,
//           style: TextStyle(
//             color: Color.fromARGB(147, 0, 0, 0),
//             fontSize: 16,
//           )),
          
//         Text(email,
//           style: TextStyle(
//                 color: Color.fromARGB(147, 0, 0, 0),
//                 fontSize: 16,
//               )),                                                                                                                                    
//       Text(mobile,
//          style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold)),
//     ],
//   );
// }

// Widget Totalstatus({required String price, required String state}) {
//   return Column(
//     children: [
//       Text(
//         '$price BDT',
//         style: TextStyle(
//             fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
//       ),
//       Text(state,
//           style: TextStyle(
//               color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold)),
//     ],
//   );
// }
