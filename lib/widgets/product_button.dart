import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:vegan_admin_panel/consts/app_styles.dart';
import 'package:vegan_admin_panel/consts/colors.dart';
import 'package:vegan_admin_panel/provider/side_menu_provider.dart';
import '../../models/products_model.dart';

class ProductButton extends StatelessWidget {
  const ProductButton({
    super.key,
    required this.productModel,
  });

  final ProductModel? productModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer<SideMenuProvider>(
          builder: (_, myProvider, child) => Flexible(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  // fixedSize: const Size(105, 20),
                  padding: const EdgeInsets.all(0),
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide.none),
                  side: BorderSide.none),
              onPressed: () async {
                myProvider.selectScreen(1,
                    isEdit: true,
                    passedAttributes: ProductModel(
                        barcode: productModel!.barcode,
                        name: productModel!.name,
                        pictureName: productModel!.pictureName,
                        categoryName: productModel!.categoryName,
                        discountedPrice: productModel!.discountedPrice,
                        price: productModel!.price,
                        isOutlet: false,
                        sizes: productModel!.sizes,
                        stock: productModel!.stock));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    IconlyBroken.edit,
                    color: AppColors.greenColor, size: 15,
                    // size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: Text(
                      'Edit',
                      style: AppStyles.styleRegular12(context)
                          .copyWith(color: AppColors.greenColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(0),
                // backgroundColor: Colors.transparent,
                // fixedSize: const Size(120, 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide.none),
                side: BorderSide.none),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  IconlyBroken.delete,
                  color: AppColors.redColor, size: 15,
                  // size: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Text(
                    'Delete',
                    style: AppStyles.styleRegular12(context)
                        .copyWith(color: AppColors.redColor),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
