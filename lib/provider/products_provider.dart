// import 'dart:convert';
// import 'dart:typed_data';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:vegan_admin_panel/models/products_model.dart';

// class ProductsProvider with ChangeNotifier {
//   final List<ProductModel> productList = [];

//   Future<void> fetchProducts() async {
//     productList.clear();
//     debugPrint('Fetching products...');
//     try {
//       final ref = FirebaseStorage.instance.ref().child('defacto_products.json');
//       final Uint8List? bytes = await ref.getData();

//       if (bytes != null) {
//         print("not null ");
//         final String jsonData = utf8.decode(bytes);
//         final data = json.decode(jsonData) as List;

//         for (var element in data) {
//           productList.add(ProductModel.fromJson(element));
//         }
//         debugPrint(productList[0].name);
//         debugPrint(productList.length.toString());

//         notifyListeners(); // Notify listeners to update UI
//       }
//     } catch (e) {
//       debugPrint('Error fetching JSON data: $e');
//     }
//   }
// }

import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:vegan_admin_panel/consts/consts.dart';
import 'package:vegan_admin_panel/models/products_model.dart';
import 'package:vegan_admin_panel/provider/categorized_products_provider.dart';

class ProductsProvider with ChangeNotifier {
  final List<ProductModel> productList2 = [];

  Future<void> fetchProducts() async {
    productList2.clear();

    debugPrint('Fetching...');
    try {
      // Reference to your JSON file in Firebase Storage
      final ref = FirebaseStorage.instance.ref().child('defacto_products.json');

      // Get data in Bytes
      final Uint8List? bytes = await ref.getData();

      // Convert Byte Array to String
      final String jsonData = utf8.decode(List.from(bytes!));

      // Decode the JSON data
      final data = json.decode(jsonData);
      // Convert Decoded JSON data to Object
      for (var element in data) {
        productList2.add(ProductModel.fromJson(element));
      }

      debugPrint(productList2[0].name);
      debugPrint(productList2.length.toString());

      print(productList2);
      CategorizedProductProvider().getCategories();
      // Print the JSON data or update the state to display it
    } catch (e) {
      debugPrint('Error fetching JSON data: $e');
    }
  }
}
