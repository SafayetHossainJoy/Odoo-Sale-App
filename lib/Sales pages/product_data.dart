import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: getListData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Map<String, dynamic>> dataList = snapshot.data!;

          return dataList.isEmpty
              ? const Center(
                  child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'No selected Product',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ))
              : ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> item = dataList[index];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        child: Container(
                          height: 60,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        item['name'],
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Quantitiy ${item['quantity']}',
                                        style: const TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  item['subtotal'],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
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
}
