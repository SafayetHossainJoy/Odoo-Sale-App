// ignore_for_file: unused_field

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale/Sales%20pages/product_data.dart';
import 'package:sale/widgets/band_color.dart';
import 'package:sale/widgets/custom_textfor_customer.dart';
import 'package:sale/widgets/widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Navigation Bar/navigation_ber.dart';
import '../Sales Controller/SQuotation_controller.dart';
import '../Sales Controller/product_controlllrt.dart';
import 'Orderline.dart';
import 'sales_page.dart';
import 'package:http/http.dart' as http;

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  String _selectedPriceList = 'Public Pricelist';
  final data = Get.put(SaleQuotationController());
  final product = Get.put(ProductController());
  List<String> customer = ["AVS"];
  TextEditingController customernameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController pricelistController = TextEditingController();
  TextEditingController globaldiscountController = TextEditingController();
  TextEditingController termsandconditionsController = TextEditingController();
  String initialValue = "Event Registration";
  String intialCustomer = "AVS";
  List<String> customerList = ["AVS"];
  List<Map<String, dynamic>> productDataList = [];
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
  String dataFromPageB = '';

  int id(int id) {
    return id;
  }

  String cookie = '';
  void navigateToPageB() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ProductInfo()),
    );
    // Update data and trigger rebuild if data is received from Page B
  }

  @override
  void initState() {
    // getListData();

    product.postData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    calculateTotalSubtotal();
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
          child: GetBuilder<ProductController>(builder: (cont) {
            return Column(
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
                const SizedBox(
                  height: 8,
                ),
                Obx(
                  () => Container(
                    child: DropdownButtonFormField<String>(
                      value: intialCustomer,
                      onChanged: (value) {
                        setState(() {
                          intialCustomer = value!;
                        });
                      },
                      items: product.isLoading.value
                          ? customerList.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList()
                          : product.customerName.map((String value) {
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
                        hintText: 'Select Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "*Select a Name";
                        }
                        return null;
                      },
                      onSaved: (value) {},
                    ),
                  ),
                ),

                //  DropdownButtonFormField<String>(
                //         value: initialValue,
                //         onChanged: (value) {
                //           setState(() {
                //             initialValue = value!;
                //           });
                //         },
                //         items: data.isLoading.value
                //             ? customer.map((String value) {
                //                 return DropdownMenuItem<String>(
                //                   value: value,
                //                   child: Text(value),
                //                 );
                //               }).toList()
                //             : data.customerName.map((String value) {
                //                 return DropdownMenuItem<String>(
                //                   value: value,
                //                   child: Text(value),
                //                 );
                //               }).toList(),
                //         decoration: InputDecoration(
                //           border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(10.0),
                //             gapPadding: 5.0,
                //             borderSide: BorderSide(
                //               color: aTextColor,
                //               width: 2.5,
                //             ),
                //           ),
                //           hintText: 'Enter Customer Name',
                //         ),
                //         validator: (value) {
                //           if (value == null || value.isEmpty) {
                //             return "*Select a customer";
                //           }
                //           return null;
                //         },
                //         onSaved: (value) {
                //           customernameController.text = value ?? '';
                //         },
                //       ),
                // const SizedBox(
                //   height: 15,
                // ),
                // const Text(
                //   'Create Date',
                //   style: TextStyle(
                //     color: Colors.black,
                //     fontSize: 16,
                //     fontWeight: FontWeight.w700,
                //   ),
                // ),
                // CustomTextFieldforcustomer(
                //   lebelText: 'Date',
                //   hintText: 'Enter your date',
                //   controller: dateController,
                //   validator: (value) {
                //     if (value.isEmpty) {
                //       return "*date required";
                //     }
                //   },
                //   validatorFn: (value) {
                //     return null;
                //   },
                // ),
                // const SizedBox(
                //   height: 15,
                // ),
                // const Text(
                //   'Price List',
                //   style: TextStyle(
                //     color: Colors.black,
                //     fontSize: 16,
                //     fontWeight: FontWeight.w700,
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // DropdownButtonFormField<String>(
                //   value: _selectedPriceList,
                //   onChanged: (newValue) {
                //     setState(() {
                //       _selectedPriceList = newValue!;
                //     });
                //   },
                //   items: <String>[
                //     'Public Pricelist',
                //     'USD',
                //   ].map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10.0),
                //       gapPadding: 5.0,
                //       borderSide: const BorderSide(
                //         color: Colors.black,
                //         width: 2.5,
                //       ),
                //     ),
                //     hintText: 'Select Price List',
                //   ),
                // ),
                // const SizedBox(
                //   height: 12,
                // ),

                // const Divider(
                //   thickness: 2,
                //   indent: 7,
                //   endIndent: 7,
                // ),

                // const SizedBox(
                //   height: 6,
                // ),
                // // const orderlineinfo_widget(),
                const SizedBox(height: 100, child: ProductList()),

                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    navigateToPageB();
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => DrapdownOrder(),
                    //     ));
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
                        children: [
                          const Text('Amount Without Discount:'),
                          const Spacer(),
                          FutureBuilder<double>(
                            future: calculateTotalSubtotal(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(snapshot.data.toString());
                              } else if (snapshot.hasError) {
                                return Text('Error');
                              } else {
                                return CircularProgressIndicator();
                              }
                            },
                          ),
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
                          const Text('0.00')
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
                          FutureBuilder<double>(
                            future: calculateTotalSubtotal(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  '${snapshot.data} ৳',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return Text('Error');
                              } else {
                                return CircularProgressIndicator();
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //Add Product Button
                const SizedBox(
                  height: 30,
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
                        // try {
                        //   if (customernameController.text.isNotEmpty) {
                        //     checkout(id: id, name: customernameController.text);
                        //   } else {
                        //     showInToast('Insert Customer Name');
                        //   }
                        // } finally {
                        //   // Navigator.push(
                        //   //     context,
                        //   //     MaterialPageRoute(
                        //   //       builder: (context) => const Invoice(),
                        //   //     ));
                        // }

                        product
                            .checkout(id: product.id, name: intialCustomer)
                            .then((value) {
                          deleteAllData()
                              .then((value) => showInToast('Added'))
                              .then((value) => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (v) => const Navigation_bar())));
                        });
                        // if (_formKey.currentState!.validate()) {
                        //   _formKey.currentState!.save();
                        //   if (image == null) {
                        //     showInToast('Order Created');
                        //   } else {
                        //     const Invoice();
                        //   }
                        // }
                      },
                      child: Center(
                        child: product.isLoadingCheck.value
                            ? const CircularProgressIndicator()
                            : Text(
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
            );
          }),
        ),
      ),
    );
  }

  Future<String> getSubtotalFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('subtotal') ?? '0.00';
  }

  Future<void> postData() async {
    List<Map<String, dynamic>> dataList = await getListData();

    var headersList = {
      'Content-Type': 'application/json',
      'Cookie': 'session_id=fd1bd949cb3165d1de13b97e43055cf08f552185'
    };
    var url = Uri.parse('http://testii.xsellencebdltd.com/api/v1/sales/');

    var body = {
      "params": {"products": dataList}
    };

    var req = http.Request('POST', url);
    req.headers.addAll(headersList);
    req.body = json.encode(body);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      final decodedResponse = json.decode(resBody);

      if (decodedResponse != null && decodedResponse['result'] != null) {
        // id = decodedResponse['result']['id'];

        id(decodedResponse['result']['id']);
      } else {
        print('Invalid response structure');
      }

      print(resBody);

      // Store the received cookie
      var cookies = res.headers['set-cookie'];
      String? sessionID;
      if (cookies != null) {
        var cookieParts =
            cookies.split(';'); // Split the cookie string into individual parts
        for (var part in cookieParts) {
          if (part.trim().startsWith('session_id=')) {
            sessionID = part.trim().substring('session_id='.length);
            break;
          }
        }
      }

// Store the session ID
      if (sessionID != null) {
        cookie = 'session_id=$sessionID';
        print('The cookie is $cookie');
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // await prefs.setString('cookie', cookie);
      }
    } else {
      print(res.reasonPhrase);
    }
  }

  Future<void> checkout({required int id, required String name}) async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'session_id=fd1bd949cb3165d1de13b97e43055cf08f552185'
    };
    var request = http.Request('POST',
        Uri.parse('http://testii.xsellencebdltd.com/api/v1/check-out/107'));
    request.body = json.encode({
      "params": {"name": "AVS"}
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  // Future<List<Map<String, dynamic>>> getListData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   // Retrieve the encoded list from SharedPreferences
  //   List<String>? encodedList = prefs.getStringList('a');

  //   // Decode the list of strings back into a list of maps
  //   List<Map<String, dynamic>> dataList = encodedList?.map((str) {
  //         Map<String, dynamic> map = jsonDecode(str);

  //         // Transform the map to the desired format
  //         Map<String, dynamic> transformedMap = {
  //           'product_id': map['id'],
  //           'product_uom_qty': int.parse(map['quantity']),
  //           'unit_price': double.parse(map['unitPrice']),
  //         };

  //         return transformedMap;
  //       }).toList() ??
  //       [];

  //   return dataList;
  // }

  Future<List<Map<String, dynamic>>> getListData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve the encoded list from SharedPreferences
    List<String>? encodedList = prefs.getStringList('a');

    // Decode the list of strings back into a list of maps
    List<Map<String, dynamic>> dataList = encodedList?.map((str) {
          Map<String, dynamic> map = jsonDecode(str);

          // Transform the map to the desired format
          Map<String, dynamic> transformedMap = {
            "product_id": map['id'],
            "product_uom_qty": int.parse(map['quantity']),
            "unit_price": double.parse(map['unitPrice']),
          };

          return transformedMap;
        }).toList() ??
        [];
    print(dataList);
    return dataList;
  }

  Future<void> deleteAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('a');

    setState(() {});
  }

  Future<void> deleteFromDataList(int index) async {
    List<Map<String, dynamic>> dataList = await getListData();

    // Check if the index is within the valid range
    if (index >= 0 && index < dataList.length) {
      // Remove the item at the specified index
      dataList.removeAt(index);

      // Encode the updated list of maps into a list of strings
      List<String> encodedList =
          dataList.map((data) => jsonEncode(data)).toList();

      SharedPreferences prefs = await SharedPreferences.getInstance();

      // Save the updated list back to SharedPreferences
      await prefs.setStringList('a', encodedList);
    }
  }

  Future<double> calculateTotalSubtotal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve the encoded list from SharedPreferences
    List<String>? encodedList = prefs.getStringList('a');

    // Decode the list of strings back into a list of maps
    List dataList = encodedList?.map((str) {
          return jsonDecode(str);
        }).toList() ??
        [];

    // Calculate the sum of the "subtotal" values
    double totalSubtotal = dataList.fold(0, (sum, data) {
      if (data.containsKey('subtotal')) {
        return sum + double.parse(data['subtotal']);
      }
      return sum;
    });
    print(' Total is $totalSubtotal');
    return totalSubtotal;
  }
}
