import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../entity/product_entity.dart';

class ProductProvider extends ChangeNotifier {

  ProductProvider() {
    log("product provider call");
    fetchProducts();
  }

  final List<ProductEntity> _products = [];
  UnmodifiableListView<ProductEntity> get products => UnmodifiableListView(_products);

  Future<List<ProductEntity>> fetchProducts() async {
    final response = await http.get(
        Uri.parse('https://mocki.io/v1/52c41978-6e31-4ea3-b917-01899e3ed373')
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return List<ProductEntity>.from(data.map((r) => ProductEntity.fromJson(r)));
    } else {
       throw Exception('Failed to load data');
    }
  }

}