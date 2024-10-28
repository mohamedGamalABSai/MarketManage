import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'package:vegan_admin_panel/test_json/model.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    try {
      // Reference to the Firebase Storage JSON file
      final ref = FirebaseStorage.instance.ref().child('defacto_products.json');
      final url = await ref.getDownloadURL();

      // Fetch the JSON file
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _products = data.map((item) => Product.fromJson(item)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error fetching products: $e');
    }
  }

  // Method to add a new product
  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }
}
