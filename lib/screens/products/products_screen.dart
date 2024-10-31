import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegan_admin_panel/loading_screen.dart';
import 'package:vegan_admin_panel/widgets/add_product_button.dart';
import 'package:vegan_admin_panel/widgets/error_widget.dart';

import '../../consts/responsive.dart';
import '../../provider/products_provider.dart';
import '../../widgets/app_bar.dart';
import 'product_card.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  final FocusNode productNameFocusNode = FocusNode();
  final FocusNode priceFocusNode = FocusNode();
  final FocusNode discountedPriceFocusNode = FocusNode();
  final FocusNode descriptionFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context: context, title: 'Products', tabBarCheck: false),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ProductsProvider>(
          builder: (_, provider, __) {
            return FutureBuilder(
              future: provider.fetchProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingPage();
                }
                if (provider.productList2.isNotEmpty) {
                  return _buildProductGrid(context, provider);
                } else {
                  return const CustomErrorWidget();
                }
              },
            );
          },
        ),
      ),
      floatingActionButton: const AddProductButton(),
    );
  }

  Widget _buildProductGrid(BuildContext context, ProductsProvider provider) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Responsive.isWeb(context)
            ? 4
            : Responsive.isTablet(context)
                ? 3
                : 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 15,
        childAspectRatio: Responsive.isWeb(context)
            ? .9
            : Responsive.isTablet(context)
                ? 0.7
                : 1.2,
      ),
      itemCount: provider.productList2.length,
      itemBuilder: (context, index) {
        return ProductCardBuilder(
          productModel: provider.productList2[index],
        );
      },
    );
  }
}
