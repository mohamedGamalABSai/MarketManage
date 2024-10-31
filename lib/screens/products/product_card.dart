import 'dart:core';
import 'package:flutter/material.dart';

import 'package:vegan_admin_panel/consts/app_styles.dart';
import 'package:vegan_admin_panel/consts/colors.dart';
import 'package:vegan_admin_panel/consts/responsive.dart';
import 'package:vegan_admin_panel/widgets/product_button.dart';
import '../../models/products_model.dart';

// ignore: must_be_immutable
class ProductCardBuilder extends StatelessWidget {
  const ProductCardBuilder({super.key, required this.productModel});

  final ProductModel? productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: Responsive.isWeb(context)
                ? MediaQuery.of(context).size.height * 0.243
                : Responsive.isTablet(context)
                    ? MediaQuery.of(context).size.height * 0.15
                    : MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(productModel!.pictureName),
                  fit: BoxFit.fitWidth,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${productModel?.name}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.styleRegular14(context)
                      .copyWith(color: AppColors.brownColor),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: productModel!.price.toStringAsFixed(2),
                                style: AppStyles.styleRegular16(context)
                                    .copyWith(color: AppColors.blackWight),
                                children: [
                                  TextSpan(
                                    text: 'EGP',
                                    style: AppStyles.styleRegular12(context)
                                        .copyWith(color: AppColors.blackWight),
                                  ),
                                ]),
                          ),
                        ]),
                    const Spacer(),
                    Text(
                      "Stock ${productModel!.stock}",
                      style: AppStyles.styleRegular12(context)
                          .copyWith(color: AppColors.lightBlackWight),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 2,
          ),

          /// Horizontal Divider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                  color: AppColors.lightBlackWight,
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          const Spacer(
            flex: 2,
          ),

          ProductButton(productModel: productModel),

          const Spacer(),
        ],
      ),
    );
  }
}
