import 'package:flutter/material.dart';
import 'package:vegan_admin_panel/models/products_model.dart';
import 'package:vegan_admin_panel/provider/products_provider.dart';
import 'package:vegan_admin_panel/provider/side_menu_provider.dart';

class SaveExitButtons extends StatelessWidget {
  const SaveExitButtons({
    super.key,
    required this.myProvider,
    required this.provider,
    required this.isEdit,
    required this.barCode,
    required this.productModel,
  });

  final SideMenuProvider myProvider;
  final ProductsProvider provider;
  final int barCode;
  final bool isEdit;
  final ProductModel? productModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              fixedSize: const Size.fromHeight(40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              side: const BorderSide(color: Colors.red)),
          onPressed: () {
            myProvider.selectScreen(
              0,
            );
          },
          child: const Row(
            children: [
              Icon(
                Icons.cancel_outlined,
                color: Colors.red,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 25,
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              backgroundColor: Colors.green,
              fixedSize: const Size.fromHeight(40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide.none),
              side: BorderSide.none),
          onPressed: () {
            !isEdit
                ? provider.addProduct().then((_) {
                    myProvider.selectScreen(0);

                    // Navigate to the home screen after adding the product
                  })
                : provider
                    .updateProduct(
                    barCode,
                    ProductModel(
                      barcode: productModel!.barcode,
                      name: provider.isNameNotEmpty
                          ? provider.nameController.text
                          : productModel!.name,
                      pictureName: provider.isNameNotEmpty
                          ? provider.pictureName!
                          : productModel!.pictureName,
                      categoryName: provider.isCategoryNotEmpty
                          ? provider.categoryName!
                          : productModel!.categoryName,
                      isOutlet: true,
                      sizes: provider.isSizesNotEmpty
                          ? provider.sizesController.text
                          : productModel!.sizes,
                      discountedPrice: provider.isDiscountedPriceNotEmpty
                          ? double.tryParse(
                              provider.discountedPriceController.text)!
                          : productModel!.discountedPrice,
                      price: provider.isPriceNotEmpty
                          ? double.tryParse(provider.priceController.text)!
                          : productModel!.discountedPrice,
                      stock: provider.isStockNotEmpty
                          ? int.tryParse(provider.stockController.text)!
                          : productModel!.stock,
                    ),
                  )
                    .then((_) {
                    // Navigate to the home screen after updating the product
                    // Adjust the route name as needed
                    myProvider.selectScreen(0);
                  });
          },
          child: Row(
            children: [
              const Icon(
                Icons.check,
                color: Colors.white,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                !isEdit ? 'Add Product' : 'Save Changes',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
