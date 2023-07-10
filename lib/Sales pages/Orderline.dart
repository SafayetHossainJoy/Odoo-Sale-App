import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale/widgets/band_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../Sales Controller/SQuotation_controller.dart';
import 'add_product.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({Key? key}) : super(key: key);

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  final _formKey = GlobalKey<FormState>();
  final data = Get.put(SaleQuotationController());
  List<String> product = ["Event Registration"];

  bool isLoading = false;
  int id = 0;
  double unitPrice = 0.0;

  TextEditingController productnameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController subtotalController = TextEditingController();
  TextEditingController unitPriceController = TextEditingController();

  TextEditingController percentOfController = TextEditingController();
  TextEditingController fixedValueController = TextEditingController();
  String initialValue = "Event Registration";

  String? fildName,
      fildId,
      fildQuantity,
      fildOriginalPrice,
      fildDiscountedPrice,
      fildDiscountType,
      fildPercentOf,
      fildFixedValue;
  //String? fildName,fildDiscountType,fildPercentOf;
  //int? fildId,fildQuantity,fildOriginalPrice,fildDiscountedPrice,fildFixedValue;
  bool onProgress = false;
  bool isVisiable = false;
  bool isImageVisiable = false;

  File? image;
  void calculateSubtotal() {
    double unitPrice = double.tryParse(unitPriceController.text) ?? 0.0;
    int quantity = int.tryParse(quantityController.text) ?? 0;
    double subtotal = unitPrice * quantity;
    subtotalController.text = subtotal.toStringAsFixed(2);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print('The is $id');
    calculateSubtotal();
    // ignore: unused_local_variable
    final double height = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    final double weidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: (Color.fromARGB(193, 255, 82, 82)),
          leading: InkWell(
            onTap: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddProduct(),
                ),
              );
            },
            child: const Icon(Icons.arrow_back_ios_new),
          ),
          title: const Text("Create Order Lines"),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Product Name'),
                  const SizedBox(height: 10),
                  Obx(
                    () => Container(
                      child: DropdownButtonFormField<String>(
                        value: initialValue,
                        onChanged: (value) {
                          var indx = data.productName.indexOf(value!);
                          setState(() {
                            initialValue = value;
                            id = data.getValueAtIndex(data.productId, indx);
                            unitPrice =
                                data.getUnitPriceAtIndex(data.unitPrice, indx);
                            unitPriceController.value =
                                TextEditingValue(text: unitPrice.toString());
                          });
                        },
                        items: data.isLoading.value
                            ? product.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList()
                            : data.productName.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            gapPadding: 5.0,
                            borderSide: BorderSide(
                              color: aTextColor,
                              width: 2.5,
                            ),
                          ),
                          hintText: 'Enter Product Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "*Select a product";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          productnameController.text = value ?? '';
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                
                  const Text('Quantity'),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: quantityController,
                    onSaved: (name) {
                      fildQuantity = name;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "*Write Product Quantity";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        gapPadding: 5.0,
                        borderSide: const BorderSide(
                          color: aTextColor,
                          width: 2.5,
                        ),
                      ),
                      hintText: 'Enter Product Quantity',
                    ),
                  ),
                  const SizedBox(height: 20),
                 
                  const Text('Unit Price'),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: unitPriceController,
                    onSaved: (name) {
                      fildDiscountedPrice = name;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "*Write Unit Price";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        gapPadding: 5.0,
                        borderSide: const BorderSide(
                          color: aTextColor,
                          width: 2.5,
                        ),
                      ),
                      hintText: 'Enter Unit Price',
                    ),
                  ),
                  // const SizedBox(height: 20),
                  // const Text('Discount %'),
                  // const SizedBox(height: 10),
                  // TextFormField(
                  //   controller: percentOfController,
                  //   onSaved: (name) {
                  //     fildPercentOf = name;
                  //   },
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return "*Write Percent Off";
                  //     }
                  //     return null;
                  //   },
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10.0),
                  //       gapPadding: 5.0,
                  //       borderSide: const BorderSide(
                  //         color: aTextColor,
                  //         width: 2.5,
                  //       ),
                  //     ),
                  //     hintText: 'Enter How Many Percent Off',
                  //   ),
                  // ),
                  const SizedBox(height: 20),
                  const Text('Subtotal'),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: subtotalController,
                    onSaved: (name) {
                      fildFixedValue = name;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "*Write Subtotal";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        gapPadding: 5.0,
                        borderSide: const BorderSide(
                          color: aTextColor,
                          width: 2.5,
                        ),
                      ),
                      hintText: 'Enter Subtotal',
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        color: Colors.black,
                        border: Border.all(
                          color: aTextColor,
                          width: 0.5,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          Map<String, dynamic> dataList = {
                            'id': id,
                            'name': initialValue,
                            'unitPrice': unitPriceController.text,
                            'subtotal': subtotalController.text,
                            'quantity': quantityController.text
                          };
                          addToDataList(dataList)
                              .then((value) => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const AddProduct(),
                                    ),
                                  ));
                        },
                        child: const Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                              color: aPrimaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Future<List<Map<String, dynamic>>> getListData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve the encoded list from SharedPreferences
    List<String>? encodedList = prefs.getStringList('a');

    // Decode the list of strings back into a list of maps
    List<Map<String, dynamic>> dataList = encodedList
            ?.map((str) => Map<String, dynamic>.from(jsonDecode(str)))
            .toList() ??
        [];

    print(dataList);
    return dataList;
  }

  Future<void> addToDataList(Map<String, dynamic> newData) async {
    List<Map<String, dynamic>> dataList = await getListData();

    // Add the new data to the existing list
    dataList.add(newData);

    // Encode the list of maps into a list of strings
    List<String> encodedList =
        dataList.map((data) => jsonEncode(data)).toList();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save the encoded list back to SharedPreferences
    await prefs.setStringList('a', encodedList);
  }
}
