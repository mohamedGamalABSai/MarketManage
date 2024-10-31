import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:vegan_admin_panel/consts/app_styles.dart';
import 'package:vegan_admin_panel/consts/colors.dart';
import 'package:vegan_admin_panel/provider/menu.dart';
import 'package:vegan_admin_panel/provider/products_provider.dart';
import 'package:vegan_admin_panel/provider/side_menu_provider.dart';
import 'package:vegan_admin_panel/widgets/choose_category.dart';
import 'package:vegan_admin_panel/widgets/pricing_section.dart';
import 'package:vegan_admin_panel/widgets/product_info_section.dart';
import 'package:vegan_admin_panel/widgets/product_media.dart';
import 'package:vegan_admin_panel/widgets/save_exit_buttons.dart';

import '../../models/products_model.dart';
import '../../widgets/app_bar.dart';

// ignore: must_be_immutable
class AddOrEditScreen extends StatelessWidget {
  AddOrEditScreen({super.key, this.isEdit = false, this.productModel});

  ProductModel? productModel;
  bool isEdit;

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<AlertDialogNotifier>(context);
    final provider = Provider.of<ProductsProvider>(context);
    final myProvider = Provider.of<SideMenuProvider>(context);
    final int barCode = productModel!.barcode;

    notifier.imageUrl = notifier.imageUrl ?? productModel!.pictureName;
    notifier.dropValue = notifier.dropValue ?? productModel!.categoryName;
    String? uid = isEdit ? productModel?.barcode.toString() : const Uuid().v4();

    return Scaffold(
      appBar: myAppBar(context: context, title: 'Products', tabBarCheck: false),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    isEdit
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Edit Product',
                                style: AppStyles.styleRegular20(context)
                                    .copyWith(color: AppColors.blackWight),
                              ),
                              Text(
                                'Dashboard > Products > Edit Product',
                                style: AppStyles.styleRegular14(context)
                                    .copyWith(color: AppColors.blackWight),
                              )
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Add Product',
                                style: AppStyles.styleRegular20(context)
                                    .copyWith(color: AppColors.blackWight),
                              ),
                              Text(
                                'Dashboard > Products > Add Product',
                                style: AppStyles.styleRegular14(context)
                                    .copyWith(color: AppColors.blackWight),
                              )
                            ],
                          ),
                    const Spacer(),
                    SaveExitButtons(
                      barCode: barCode,
                      myProvider: myProvider,
                      provider: provider,
                      isEdit: isEdit,
                      productModel: productModel,
                      notifier: notifier,
                    )
                  ],
                ),
              ),
              ConditionalBuilder(
                condition: true,
                builder: (context) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: ProductInfoSection(provider: provider),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            PricingSection(provider: provider),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Column(
                          children: [
                            ProductMedia(
                              notifier: notifier,
                              isEdit: isEdit,
                              productModel: productModel,
                              uid: uid,
                              provider: provider,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ChooseCategory(
                              notifier: notifier,
                              provider: provider,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                fallback: (context) => const Center(
                  child: SpinKitThreeBounce(
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
