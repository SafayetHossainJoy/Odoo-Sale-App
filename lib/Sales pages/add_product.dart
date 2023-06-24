import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sale/widgets/band_color.dart';
import 'package:sale/widgets/custom_textfor_customer.dart';
import 'package:sale/widgets/widget.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Invoice pages/invoice.dart';
import 'drapdown.dart';
import 'orderlineinfo_widget.dart';
import 'sales_page.dart';


class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController customernameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController pricelistController = TextEditingController();
  TextEditingController globaldiscountController = TextEditingController();
  TextEditingController termsandconditionsController = TextEditingController();

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
        backgroundColor: (const Color.fromARGB(193, 255, 82, 82)),
        leading: InkWell(
            onTap: () {
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const sales(),
                  ));
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        title: const Text("Create New Sales Order"),
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
                  'Customer Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                CustomTextFieldforcustomer(
                  lebelText: 'Customer Name',
                  hintText: 'Enter your Customer name',
                  controller: customernameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "*Customername required";
                    }
                    if (value.length < 3) {
                      return "*Customername is too short,write minimum 3 letter";
                    } else if (value.length > 20) {
                      return "*Customer name is long";
                    }
                  },
                  validatorFn: (value) {
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Create Date',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                CustomTextFieldforcustomer(
                  lebelText: 'Date',
                  hintText: 'Enter your date',
                  controller: dateController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "*date required";
                    }
                  },
                  validatorFn: (value) {
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Price List',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                CustomTextFieldforcustomer(
                  lebelText: 'Price List',
                  hintText: 'Enter your Price',
                  controller: pricelistController,
                  keytype: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "*Price List required";
                    }
                  },
                  validatorFn: (value) {
                    return null;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),

                const Divider(
                  thickness: 2,
                  indent: 7,
                  endIndent: 7,
                ),

                const SizedBox(
                  height: 6,
                ),
                const orderlineinfo_widget(),

                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  DrapdownOrder(),
                        ));
                  },
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                          color: const Color(0xFF444C60),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text("Add Products",
                          style: GoogleFonts.nunito(
                              color: const Color(0xFFF8F8FF))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
         SizedBox(
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'Discount Type:Fixed',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: CustomTextFieldforcustomer(
                        lebelText: 'Discount',
                        hintText: 'Global Discount',
                        controller: globaldiscountController,
                        keytype: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "*Discount required";
                          }
                        },
                        validatorFn: (value) {
                          return null;
                        },
                      ),
                    ),
                    // const SizedBox(
                    //   width: 5,
                    // ),
                    Expanded(
                        flex: 5,
                        child: CustomTextFieldforcustomer(
                          lebelText: 'Terms and Conditions',
                          hintText: 'Terms and Conditions....',
                          controller: termsandconditionsController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "*termsandconditions required";
                            }
                          },
                          validatorFn: (value) {
                            return null;
                          },
                        )),
                  ],
                ),


                const SizedBox(
                  height: 35,
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text('Amount Without Discount:'),
                          const Spacer(),
                          const Text('100000.00')
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text('Untaxed Amount:'),
                          const Spacer(),
                          const Text('100000.00')
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Text('Fixed Discount:'),
                          Spacer(),
                          Text('0.00')
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Text('Total Discount:'),
                          Spacer(),
                          Text('0.00')
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        height: 5,
                        thickness: 1,
                        color: Color.fromARGB(255, 135, 114, 114),
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            'Total:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            '100000.00 ৳',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
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
                      onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Invoice(),
                  ));
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          if (image == null) {
                            showInToast(
                                'Order Created');
                          } else {
                            const Invoice();
                          }
                        }
                      },
                        child: const Center(
                          child: Text(
                            'Confirm',
                            style: TextStyle(
                                color: aPrimaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),   
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
