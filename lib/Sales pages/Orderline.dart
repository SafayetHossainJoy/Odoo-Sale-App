import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sale/widgets/band_color.dart';


import 'add_product.dart';



class ProductInfo extends StatefulWidget {
  const ProductInfo({Key? key}) : super(key: key);

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController productnameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController uomController = TextEditingController();
  TextEditingController unitPriceController = TextEditingController();

  TextEditingController percentOfController = TextEditingController();
  TextEditingController fixedValueController = TextEditingController();

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
 

  @override
  Widget build(BuildContext context) {
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
                  ));
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        title: const Text("Create Order Lines"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        //padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Product Name',
                ),

                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: productnameController,
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
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          gapPadding: 5.0,
                          borderSide:
                              const BorderSide(color: aTextColor, width: 2.5)),
                      hintText: 'Enter Product Name'),
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                // const addmore(),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Description',
                ),

                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: descriptionController,
                  onSaved: (description) {
                    fildName = description;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "*Write Description";
                    }
                    if (value.length < 3) {
                      return "*Write more then three word";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          gapPadding: 5.0,
                          borderSide:
                              const BorderSide(color: aTextColor, width: 2.5)),
                      hintText: 'Enter Product Description'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Quantity',
                ),

                const SizedBox(
                  height: 10,
                ),
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
                          borderSide:
                              const BorderSide(color: aTextColor, width: 2.5)),
                      hintText: 'Enter Product Quantity'),
                ),
                const SizedBox(
                  height: 20,
                ),

                const Text(
                  'Unit of Measure',
                ),

                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: uomController,
                  onSaved: (uom) {
                    fildOriginalPrice = uom;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "*Write Unit of Measure";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          gapPadding: 5.0,
                          borderSide:
                              const BorderSide(color: aTextColor, width: 2.5)),
                      hintText: 'Enter Unit of Measure'),
                ),
                const SizedBox(
                  height: 20,
                ),

                const Text(
                  'Unit Price',
                ),

                const SizedBox(
                  height: 10,
                ),
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
                          borderSide:
                              const BorderSide(color: aTextColor, width: 2.5)),
                      hintText: 'Enter Unit Price'),
                ),
                const SizedBox(
                  height: 20,
                ),

                const Text(
                  'Discount %',
                ),

                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: percentOfController,
                  onSaved: (name) {
                    fildPercentOf = name;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "*Write Percent Off";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          gapPadding: 5.0,
                          borderSide:
                              const BorderSide(color: aTextColor, width: 2.5)),
                      hintText: 'Enter How Many Percent Off'),
                ),
                const SizedBox(
                  height: 20,
                ),

                const Text(
                  'Subtotal',
                ),

                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: fixedValueController,
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
                          borderSide:
                              const BorderSide(color: aTextColor, width: 2.5)),
                      hintText: 'Enter Subtotal'),
                ),

                //Add Product Button
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      color: Colors.black,
                      border: Border.all(color: aTextColor, width: 0.5),
                    ),
                    child: TextButton(
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        //   _formKey.currentState!.save();
                        //   if (image == null) {
                        //     showInToast(
                        //         'Please upload Product image from your mobile');
                        //   } else {
                        //     createProduct();
                        //   }
                        // }
                      },
                      child: InkWell(
                         onTap: () {
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddProduct(),
                  ));
            },
                        child: const Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                                color: aPrimaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //Add Sales order Button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
