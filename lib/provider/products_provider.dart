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
import 'package:flutter/material.dart';
import 'package:vegan_admin_panel/models/products_model.dart';

class ProductsProvider with ChangeNotifier {
  final List<ProductModel> productList2 = [];

  // Define TextEditingControllers for each field in ProductModel
  final TextEditingController barcodeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController discountedPriceController =
      TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController isOutletController = TextEditingController();
  final TextEditingController sizesController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  String? pictureName;
  String? categoryName;

  // Boolean flags for field validation
  bool isBarcodeNotEmpty = false;
  bool isNameNotEmpty = false;
  bool isDiscountedPriceNotEmpty = false;
  bool isPriceNotEmpty = false;
  bool isOutletNotEmpty = false;
  bool isSizesNotEmpty = false;
  bool isStockNotEmpty = false;
  bool isCategoryNotEmpty = false;
  bool isPictureNotEmpty = false;

  ProductsProvider() {
    // Add listeners to TextEditingControllers
    _initializeListeners();
  }

  void _initializeListeners() {
    barcodeController.addListener(() {
      isBarcodeNotEmpty = barcodeController.text.isNotEmpty;
      notifyListeners();
    });
    nameController.addListener(() {
      isNameNotEmpty = nameController.text.isNotEmpty;
      notifyListeners();
    });
    discountedPriceController.addListener(() {
      isDiscountedPriceNotEmpty = discountedPriceController.text.isNotEmpty;
      notifyListeners();
    });
    priceController.addListener(() {
      isPriceNotEmpty = priceController.text.isNotEmpty;
      notifyListeners();
    });
    isOutletController.addListener(() {
      isOutletNotEmpty = isOutletController.text.isNotEmpty;
      notifyListeners();
    });
    sizesController.addListener(() {
      isSizesNotEmpty = sizesController.text.isNotEmpty;
      notifyListeners();
    });
    stockController.addListener(() {
      isStockNotEmpty = stockController.text.isNotEmpty;
      notifyListeners();
    });

    // Check for picture and category name
    _updatePictureAndCategoryFlags();
  }

  void _updatePictureAndCategoryFlags() {
    isPictureNotEmpty = pictureName != null && pictureName!.isNotEmpty;
    isCategoryNotEmpty = categoryName != null && categoryName!.isNotEmpty;
    notifyListeners();
  }

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

  Future<void> addProduct() async {
    ProductModel newProduct = ProductModel(
      barcode: int.tryParse(barcodeController.text) ?? 0,
      name: nameController.text,
      pictureName: pictureName ?? '',
      categoryName: categoryName ?? '',
      discountedPrice: double.tryParse(discountedPriceController.text) ?? 0.0,
      price: double.tryParse(priceController.text) ?? 0.0,
      isOutlet: isOutletController.text.toLowerCase() == 'true',
      sizes: sizesController.text,
      stock: int.tryParse(stockController.text) ?? 0,
    );

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
      debugPrint('Product updated successfully');
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

  // Call this method whenever pictureName or categoryName is updated
  void updatePictureName(String? newPictureName) {
    pictureName = newPictureName;
    _updatePictureAndCategoryFlags();
  }

  void updateCategoryName(String? newCategoryName) {
    categoryName = newCategoryName;
    _updatePictureAndCategoryFlags();
  }
}
