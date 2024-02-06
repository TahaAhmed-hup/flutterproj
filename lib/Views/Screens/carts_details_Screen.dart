// ignore_for_file: file_names, non_constant_identifier_names, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_application_3/Models/Carts_Model.dart';
import 'package:flutter_application_3/Service/Carts_Service.dart';

class CartsScreen extends StatefulWidget {
  const CartsScreen({super.key});

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  late List<Product> cart = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    cart = await CartsService.getCartsData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView.builder(
          itemCount: cart.length, // 1 for cart details
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(7)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Cart ID : ${cart[index].id}'),
                    Text('Total Price : \$${cart[index].price}'),
                    Text('Total quantity : ${cart[index].quantity}'),
                    Text('Total Products : ${cart[index].total}'),
                    Text(
                        'discountPercentage : \$${cart[index].discountPercentage}'),
                    Text('DiscountedPrice : \$${cart[index].discountedPrice}'),
                    const SizedBox(height: 10),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Products: ${cart[index].title}'),
                          const Icon(Icons.shopping_cart_checkout)
                        ])
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
