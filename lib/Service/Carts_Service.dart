// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:flutter_application_3/Models/Carts_Model.dart';

class CartsService {
  static final dio = Dio();
  static Future<List<Product>> getCartsData() async {
    final response = await dio.get('https://dummyjson.com/carts/1');

    var data = response.data;
    CartsModel cartModel = CartsModel.fromJson(data);

    return cartModel.products ?? [];
  }
}
