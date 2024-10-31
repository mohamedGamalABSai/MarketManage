import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyMenuController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _gridScaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _addProductScaffoldKey =
      GlobalKey<ScaffoldState>();
  // Getters
  GlobalKey<ScaffoldState> get getScaffoldKey => _scaffoldKey;
  GlobalKey<ScaffoldState> get getGridScaffoldKey => _gridScaffoldKey;
  GlobalKey<ScaffoldState> get getAddProductScaffoldKey =>
      _addProductScaffoldKey;

  // Callbacks
  void controlDashboardMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  void controlProductsMenu() {
    if (!_gridScaffoldKey.currentState!.isDrawerOpen) {
      _gridScaffoldKey.currentState!.openDrawer();
    }
  }

  void controlAddProductsMenu() {
    if (!_addProductScaffoldKey.currentState!.isDrawerOpen) {
      _addProductScaffoldKey.currentState!.openDrawer();
    }
  }
}

class AlertDialogNotifier with ChangeNotifier {
  double discountPercentage = 0;
  calculatePercentage(int price, int discountedPrice) {
    discountPercentage = (1 - (discountedPrice / price)) * 100;
  }

  bool checkBoxValue = false;
  void changeCheckBoxValue(value) {
    checkBoxValue = value;
    notifyListeners();
  }

  String? dropValue;
  void changeDropMenu(value) {
    dropValue = value;
    notifyListeners();
  }

  File? pickedImage;
  late Uint8List webImage = Uint8List(8);
  Future<void> pickImage(productUid) async {
    if (!kIsWeb) {
      final ImagePicker picker0 = ImagePicker();
      XFile? image = await picker0.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = File(image.path);
        pickedImage = selected;
        log(image.name);
        notifyListeners();
      } else {
        log('No image has been picked');
      }
    } else if (kIsWeb) {
      final ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        webImage = f;
        pickedImage = File('a');
        uploadImageToStorage(productUid);
        notifyListeners();
      } else {
        log('No image has been picked');
      }
    } else {
      log('Something went wrong');
    }
  }

  String? imageUrl;
  bool loadingUrl = false;
  void uploadImageToStorage(productUid) async {
    loadingUrl = true;
    notifyListeners();
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('ProductImages/')
          .child('$productUid.jpg');
      if (kIsWeb) {
        await ref.putData(webImage, SettableMetadata(contentType: 'jpg'));
      } else {
        await ref.putFile(pickedImage!);
      }
      imageUrl = await ref.getDownloadURL().then((value) {
        if (value.isNotEmpty) {
          loadingUrl = false;
          notifyListeners();
          log(value);
        }
        return null;
      });
      debugPrint(imageUrl);
    } on FirebaseException catch (error) {
      print(error.message);
    } catch (error) {
      print(error);
    }
  }
}
