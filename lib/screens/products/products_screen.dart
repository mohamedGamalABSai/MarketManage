import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:vegan_admin_panel/consts/colors.dart';
import 'package:vegan_admin_panel/loading_screen.dart';

import '../../consts/responsive.dart';
import '../../models/products_model.dart';
import '../../provider/products_provider.dart';
import '../../provider/side_menu_provider.dart';
import '../../widgets/app_bar.dart';
import 'product_card.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  final TextEditingController productName = TextEditingController();
  final TextEditingController priceText = TextEditingController();
  final TextEditingController discountedPrice = TextEditingController();
  final TextEditingController description = TextEditingController();
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
          builder: (_, provider, __) => StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('Products').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingPage();
              }
              if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                return _buildProductGrid(context, snapshot);
              } else {
                return _buildNoProductsPlaceholder(context);
              }
            },
          ),
        ),
      ),
      floatingActionButton: const AddProductButton(),
    );
  }

  Widget _buildProductGrid(
      BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Responsive.isDesktop(context)
            ? 4
            : Responsive.isTablet(context)
                ? 3
                : 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 15,
        childAspectRatio: Responsive.isDesktop(context) ? 0.93 : 0.85,
      ),
      itemCount: snapshot.data!.docs.length,
      itemBuilder: (context, index) {
        return ProductCardBuilder(
          productModel: ProductModel.fromJson(
              snapshot.data!.docs[index].data() as Map<String, dynamic>),
        );
      },
    );
  }

  Widget _buildNoProductsPlaceholder(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/random/box.png'),
            height: 250,
            width: 250,
          ),
          SizedBox(height: 10),
          Text(
            'Whoops',
            style: TextStyle(
                fontSize: 29, fontWeight: FontWeight.bold, color: Colors.red),
          ),
          SizedBox(height: 10),
          Text(
            'No Products Available to show',
            style: TextStyle(color: Colors.black, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          AddProductButton(),
        ],
      ),
    );
  }
}

class AddProductButton extends StatelessWidget {
  const AddProductButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SideMenuProvider>(
      builder: (_, provider, __) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightBrownColor,
          fixedSize: Size(44.sp, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          provider.selectScreen(2,
              passedAttributes: ProductModel(
                id: '',
                title: '',
                description: '',
                imageUrl: null,
                productCategoryName: null,
                price: 0.0,
                salePrice: 0.0,
                isOnSale: false,
                scale: '1 Kg',
                stock: 0,
                discountPercentage: '',
              ));
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.add_circle_outline, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              'Add Product',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
