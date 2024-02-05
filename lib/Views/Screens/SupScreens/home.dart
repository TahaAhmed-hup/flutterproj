// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_application_3/Models/Product_Model.dart';
import 'package:flutter_application_3/Service/Product_Service.dart';
import 'package:flutter_application_3/Views/Screens/product_details_screen.dart';
import 'package:flutter_application_3/widgets/card.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  bool isloadin = true;
  List<Product> productList = [];

  Future<void> getdata() async {
    productList = await ProductService.getProductData();
    isloadin = false;
    setState(() {});
  }
  @override
  void initState() {
    super.initState();
    getdata();
  }



  @override
  Widget build(BuildContext context) {
    return isloadin
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: productList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(
                                product: productList[index],
                              )),
                    );
                  },
                  child: card(
                    productName: productList[index].title ?? "--",
                    price: "${productList[index].price}",
                    thumbnail: productList[index].thumbnail ?? "",
                  ));
            },
          );
  }
  }

