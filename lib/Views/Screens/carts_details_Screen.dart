// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Models/Carts_Model.dart';
import 'package:flutter_application_3/Service/Carts_Service.dart';

class CartsScreen extends StatefulWidget {
  const CartsScreen({super.key});

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  List<Cart> CartsList = [];
  Cart? selectedCart;
  Future<void> getData() async {
    try {
      CartsList = await CartsService.getCartsData();
      setState(() {});
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching data: $error');
      }
      // Handle error appropriately, e.g., show a snackbar
    }
  }


  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carts Page'),
      ),
      body: _buildBody(),
    );
  }
  Widget _buildBody() {
    if (CartsList.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: CartsList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(CartsList[index].id.toString()),
                  onTap: () {
                    setState(() {
                      selectedCart = CartsList[index];
                    });
                  },
                );
              },
            ),
          ),
          if (selectedCart != null)
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Selected Cart ID: ${selectedCart!.id}'),
                ],
              ),
            ),
        ],
      );
    }
  }
}

