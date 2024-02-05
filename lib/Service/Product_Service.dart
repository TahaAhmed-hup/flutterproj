// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:flutter_application_3/Models/Product_Model.dart';
import 'package:flutter_application_3/Network_Settings.dart';

class ProductService {
  static final dio = Dio();
  static Future<List<Product>> getProductData() async {
    final response = await dio.get("${NetworkSettings.baseUrl}products");

    var data = response.data;
    Productmodel productsModel = Productmodel.fromJson(data);

    return productsModel.products ?? [];
  }
}
