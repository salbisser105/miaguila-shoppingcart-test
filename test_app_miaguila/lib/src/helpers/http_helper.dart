import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_app_miaguila/src/models/product_model.dart';

Future<ProductModel> fetchData() async {
  final response =
      await http.get(Uri.parse('https://fakestoreapi.com/products/'));

  if (response.statusCode == 200) {
    return ProductModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('failed to load data');
  }
}