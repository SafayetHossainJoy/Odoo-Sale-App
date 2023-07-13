import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale/Customer_Controller/CustomerController.dart';
import 'package:sale/Search___Filter/filter.dart';
import 'Customer_widget.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({Key? key}) : super(key: key);

  @override
  State<CustomerList> createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  final data = Get.put(CustomerController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: (const Color.fromARGB(193, 255, 82, 82)),
        title: const Text("Contact",
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        actions: [
          InkWell(
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(Icons.filter_alt_outlined),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ));
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Obx(
          () {
            if (data.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (data.customerallData != null) {
                // Display the Customer data using the Customermodel
                return ListView.builder(
                  itemCount: data.customerallData?.result.length,
                  
                  itemBuilder: (BuildContext context, int index) {
                 
                    return Customer_widget(
                      // mobile: data.customerallData!.result[index].mobile.toString(),
                      // email: data.customerallData!.result[index].email.toString(),
                      // companyName:
                      //     data.customerallData!.result[index].companyName.toString(),
                      
                      name: data.customerallData!.result[index].name.toString(),
                    );
                  
                  },
                );
              } else {
                return const Center(
                  child: Text('No data available'),
                );
              }
            }
          },
        ),
      ),
    );
  }
    Future<void> _refresh() async {
    data.fetchcustomerallData();
  }
}
