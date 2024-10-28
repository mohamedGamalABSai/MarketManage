import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:vegan_admin_panel/consts/consts.dart';
import 'package:vegan_admin_panel/models/products_model.dart';

class CategorizedProductProvider with ChangeNotifier {
  Map<String, List<ProductModel>>? categorizedProductList = {};

  Future<void> fetchCategorizedProduct(String category) async {
    List<ProductModel> categorizedproductsList = [];
    print('Fetching CategorizedProduct...');
    try {
      productList.clear();
      final ref = FirebaseStorage.instance.ref().child('defacto_products.json');

      // Get data in Bytes
      final Uint8List? bytes = await ref.getData();

      // Convert Byte Array to String
      final String jsonData = utf8.decode(List.from(bytes!));

      // Decode the JSON data
      final data = json.decode(jsonData);

      // Convert Decoded JSON data to Object
      for (var element in data) {
        productList.add(ProductModel.fromJson(element));
      }

      categorizedproductsList.clear();
      for (ProductModel element in productList) {
        if (element.categoryName == category) {
          print(
              'Product Category: ${element.categoryName} ///// Search Keyword: $category');
          categorizedproductsList.add(element);
        }
      }

      // Convert Decoded JSON data to Object
      categorizedProductList?.putIfAbsent(
          category, () => categorizedproductsList);
      debugPrint(categorizedproductsList.length.toString());
      debugPrint(
          'CategorizedProduct: ${categorizedProductList!.length} $category');
      // Print the JSON data or update the state to display it
    } catch (e) {
      debugPrint('Error fetching JSON data: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getCategories() async {
    for (var product in productList) {
      if (categoriesList
          .any((element) => element['category'] == product.categoryName)) {
        continue;
      } else {
        categoriesList.add({
          'category': product.categoryName,
          'categoryImage': product.pictureName
        });
      }
    }
    debugPrint('Categories List: ${categoriesList.length}');
    notifyListeners();
    return categoriesList;
  }

  Future<void> checkIfExist(String category) async {
    if (categorizedProductList!.containsKey(category)) {
      print('CategorizedProduct: ${categorizedProductList!.length} $category');
      return;
    } else {
      await fetchCategorizedProduct(category);
      print('CategorizedProduct: ${categorizedProductList!.length} $category');
    }
  }
}
