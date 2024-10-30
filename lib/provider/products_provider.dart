// import 'dart:convert';
// import 'dart:typed_data';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:vegan_admin_panel/models/products_model.dart';

// class ProductsProvider with ChangeNotifier {
//   final List<ProductModel> productList2 = [];

//   Future<void> fetchProducts() async {
//     productList2.clear();
//     debugPrint('Fetching...');

//     try {
//       final ref = FirebaseStorage.instance.ref().child('defacto_products.json');

//       final Uint8List? bytes = await ref.getData();
//       if (bytes != null) {
//         final String jsonData = utf8.decode(bytes);
//         final List<dynamic> data = json.decode(jsonData);

//         productList2
//             .addAll(data.map((element) => ProductModel.fromJson(element)));
//       } else {
//         debugPrint('No data found in Firebase Storage.');
//       }
//     } catch (e) {
//       debugPrint('Error fetching JSON data: $e');
//     }
//   }

//   Future<void> addProduct(ProductModel newProduct) async {
//     productList2.add(newProduct);
//     await _saveProductsToFirebase();
//     notifyListeners();
//   }

//   Future<void> updateProduct(int barcode, ProductModel updatedProduct) async {
//     final index =
//         productList2.indexWhere((product) => product.barcode == barcode);
//     if (index != -1) {
//       productList2[index] = updatedProduct;
//       await _saveProductsToFirebase();
//       notifyListeners();
//     }
//   }

//   Future<void> _saveProductsToFirebase() async {
//     try {
//       final ref = FirebaseStorage.instance.ref().child('defacto_products.json');

//       final List<Map<String, dynamic>> jsonData =
//           productList2.map((product) => product.toJson()).toList();
//       final String jsonString = json.encode(jsonData);

//       final metadata = SettableMetadata(contentType: 'application/json');

//       await ref.putData(
//         Uint8List.fromList(utf8.encode(jsonString)),
//         metadata,
//       );
//       debugPrint('Products saved successfully');
//     } catch (e) {
//       debugPrint('Error saving products: $e');
//     }
//   }
// }

import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:vegan_admin_panel/models/products_model.dart';

class ProductsProvider with ChangeNotifier {
  final List<ProductModel> productList2 = [];

  Future<void> fetchProducts() async {
    productList2.clear();
    debugPrint('Fetching...');

    try {
      final ref = FirebaseStorage.instance.ref().child('defacto_products.json');

      final Uint8List? bytes = await ref.getData();
      if (bytes != null) {
        final String jsonData = utf8.decode(bytes);
        final List<dynamic> data = json.decode(jsonData);

        productList2
            .addAll(data.map((element) => ProductModel.fromJson(element)));
      } else {
        debugPrint('No data found in Firebase Storage.');
      }
    } catch (e) {
      debugPrint('Error fetching JSON data: $e');
    }
  }

  Future<void> addProduct(ProductModel newProduct) async {
    productList2.add(newProduct);
    await _saveProductsToFirebase();
    notifyListeners();
  }

  Future<void> updateProduct(int barcode, ProductModel updatedProduct) async {
    final index =
        productList2.indexWhere((product) => product.barcode == barcode);
    if (index != -1) {
      productList2[index] = updatedProduct;
      await _saveProductsToFirebase();
      notifyListeners();
    }
  }

  Future<void> deleteProduct(int barcode) async {
    final index =
        productList2.indexWhere((product) => product.barcode == barcode);
    if (index != -1) {
      productList2.removeAt(index);
      await _saveProductsToFirebase();
      notifyListeners();
      debugPrint('Product deleted successfully');
    } else {
      debugPrint('Product not found');
    }
  }

  Future<void> _saveProductsToFirebase() async {
    try {
      final ref = FirebaseStorage.instance.ref().child('defacto_products.json');

      final List<Map<String, dynamic>> jsonData =
          productList2.map((product) => product.toJson()).toList();
      final String jsonString = json.encode(jsonData);

      final metadata = SettableMetadata(contentType: 'application/json');

      await ref.putData(
        Uint8List.fromList(utf8.encode(jsonString)),
        metadata,
      );
      debugPrint('Products saved successfully');
    } catch (e) {
      debugPrint('Error saving products: $e');
    }
  }
}
