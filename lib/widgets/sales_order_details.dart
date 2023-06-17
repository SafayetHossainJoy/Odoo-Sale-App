/*
import 'package:dynamic_textfield_test/band_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TextEditingController> listController = [TextEditingController()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ignore: prefer_const_constructors
              // Padding(
              //   padding: const EdgeInsets.all(20),
              //   // ignore: prefer_const_constructors
              //   child: Text(
              //     "Product Name",
              //     style: const TextStyle(
              //       color: Colors.black,
              //       fontSize: 16,
              //       fontWeight: FontWeight.w700,
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                shrinkWrap: true,
                itemCount: listController.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: aBackgroundColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              controller: listController[index],
                              autofocus: false,
                              style: const TextStyle(color: Color(0xFFF8F8FF)),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Input Text Here",
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 132, 140, 155)),
                              ),
                            ),
                          ),`
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        index != 0
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    listController[index].clear();
                                    listController[index].dispose();
                                    listController.removeAt(index);
                                  });
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Color(0xFF6B74D6),
                                  size: 35,
                                ),
                              )
                            : const SizedBox(),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: aBackgroundColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              controller: listController[index],
                              autofocus: false,
                              style: const TextStyle(color: Color(0xFFF8F8FF)),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Input Text Here",
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 132, 140, 155)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        index != 0
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    listController[index].clear();
                                    listController[index].dispose();
                                    listController.removeAt(index);
                                  });
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Color(0xFF6B74D6),
                                  size: 35,
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              // GestureDetector(
              //   onTap: () {
              //     setState(() {
              //       listController.add(TextEditingController());
              //     });
              //   },
              //   child: Center(
              //     child: Container(
              //       padding: const EdgeInsets.symmetric(
              //           horizontal: 20, vertical: 15),
              //       decoration: BoxDecoration(
              //           color: const Color(0xFF444C60),
              //           borderRadius: BorderRadius.circular(10)),
              //       child: Text("Add More",
              //           style:
              //               GoogleFonts.nunito(color: const Color(0xFFF8F8FF))),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   width: 10,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
*/