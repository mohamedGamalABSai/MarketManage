import 'package:flutter/cupertino.dart';
import 'package:vegan_admin_panel/screens/products/add_or_edit_screen.dart';

import '../screens/ordersScreen/orders_screen.dart';
import '../screens/products/products_screen.dart';

class SideMenuProvider with ChangeNotifier {
  static Widget selectedWidget = ProductsScreen();

  void selectScreen(int index, {passedAttributes, isEdit = false}) {
    if (index == 0) {
      selectedWidget = ProductsScreen();
    } else if (index == 1) {
      selectedWidget = AddOrEditScreen(
        productModel: passedAttributes,
        isEdit: isEdit,
      );
    } else if (index == 2) {
      selectedWidget = const OrdersScreen();
    }
    notifyListeners();
  }
}
