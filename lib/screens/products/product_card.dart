import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:vegan_admin_panel/consts/colors.dart';
import 'package:vegan_admin_panel/provider/side_menu_provider.dart';
import '../../models/products_model.dart';

// ignore: must_be_immutable
class ProductCardBuilder extends StatelessWidget {
  ProductCardBuilder({super.key, required this.productModel});

  final TextEditingController productName = TextEditingController();
  final TextEditingController priceText = TextEditingController();
  final TextEditingController discountedPrice = TextEditingController();
  final TextEditingController description = TextEditingController();
  final FocusNode productNameFocusNode = FocusNode();
  final FocusNode priceFocusNode = FocusNode();
  final FocusNode discountedPriceFocusNode = FocusNode();
  final FocusNode descriptionFocusNode = FocusNode();
  int count = 1;
  final ProductModel? productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            productModel!.pictureName,
            width: 180,
            height: 150,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${productModel?.name}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontSize: 15.sp),
                ),
                Row(
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'EGP',
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 12,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        productModel!.price.toStringAsFixed(2),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.green),
                                  ),
                                ]),
                          ),
                          Visibility(
                            visible: true,
                            child: RichText(
                              text: TextSpan(
                                  text: 'EGP ',
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 12,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: productModel!.price
                                          ?.toStringAsFixed(2),
                                      style: const TextStyle(
                                          fontSize: 12,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.grey),
                                    ),
                                  ]),
                            ),
                          ),
                        ]),
                    const Spacer(),
                    Text(
                      "${productModel!.campaignDiscountedPrice}",
                      style: const TextStyle(fontSize: 15),
                    )
                  ],
                ),
              ],
            ),
          ),

          /// Horizontal Divider
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 2,
              width: 220,
              color: Colors.grey.shade300,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Consumer<SideMenuProvider>(
                builder: (_, myProvider, child) => OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      fixedSize: const Size(105, 40),
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
                  child: const Row(
                    children: [
                      Icon(
                        IconlyBroken.edit,
                        color: AppColors.greenColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Edit',
                        style: TextStyle(color: AppColors.greenColor),
                      ),
                    ],
                  ),
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    // backgroundColor: Colors.transparent,
                    fixedSize: const Size(120, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide.none),
                    side: BorderSide.none),
                onPressed: () {},
                child: const Row(
                  children: [
                    Icon(
                      IconlyBroken.delete,
                      color: AppColors.redColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Delete',
                      style: TextStyle(color: AppColors.redColor),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
