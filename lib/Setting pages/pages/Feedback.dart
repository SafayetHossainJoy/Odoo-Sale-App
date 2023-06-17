import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sale/widgets/band_color.dart';

import '../../Sales pages/sales_page.dart';

class Review extends StatefulWidget {
  const Review({Key? key}) : super(key: key);

  get product => null;

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  TextEditingController nameController = TextEditingController();
  String? fildName;
  var _image;
  final ImagePicker _picker = ImagePicker();
  chooseImage() {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("Choose Image from"),
            children: [
              SimpleDialogOption(
                child: const Text("Choose from Gallery"),
                onPressed: () {
                  chooseImageFromGallery();
                },
              ),
              SimpleDialogOption(
                child: const Text("Choose from Camera"),
                onPressed: () {
                  chooseImageFromCamera();
                },
              ),
              SimpleDialogOption(
                child: const Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  chooseImageFromGallery() async {
    var pickImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickImage!.path);
    });
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  chooseImageFromCamera() async {
    var pickImage = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(pickImage!.path);
    });
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

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
          "Feedback",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/Trivoz.png",
                height: 120,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Drop Your Image",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 12, 12, 12),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 18),
                    InkWell(
                      onTap: () {
                        chooseImage();
                      },
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 100,
                              width: 120,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey)),
                              child: Container(
                                  margin: const EdgeInsets.all(3),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: _image != null
                                      ? CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          backgroundImage:
                                              NetworkImage(_image.path),
                                        )
                                      : IconButton(
                                          icon: const Icon(Icons.camera),
                                          onPressed: () {
                                            chooseImage();
                                          },
                                        )),
                            ),
                          ),
                          Positioned(
                            top: -10,
                            right: 120,
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _image = null;
                                  });
                                },
                                icon: const Icon(
                                  Icons.cancel_sharp,
                                  size: 30,
                                  color: Colors.black,
                                )),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      "Comment",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 12, 12, 12),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 18),
                    TextFormField(
                      controller: nameController,
                      onSaved: (name) {
                        fildName = name;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "*Write Product Name";
                        }
                        if (value.length < 3) {
                          return "*Write more then three word";
                        }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              gapPadding: 5.0,
                              borderSide: const BorderSide(
                                  color: aTextColor, width: 2.5)),
                          hintText: 'Enter your Comment'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(
                            left: 120, right: 30, top: 20),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        height: 45,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          color: const Color.fromARGB(255, 199, 67, 67),
                          border: Border.all(
                              color: const Color.fromARGB(255, 231, 81, 71),
                              width: 0.5),
                        ),
                        child: InkWell(
                          onTap: () {
                            const snackBar =
                                SnackBar(content: Text("send Successful"));
                            //Scaffold.of(context).showSnackBar(snackBar);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          child: const Text(
                            "Send",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
