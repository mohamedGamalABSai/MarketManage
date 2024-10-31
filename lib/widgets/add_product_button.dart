import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegan_admin_panel/consts/app_styles.dart';
import 'package:vegan_admin_panel/consts/colors.dart';
import 'package:vegan_admin_panel/models/products_model.dart';
import '../../provider/side_menu_provider.dart';

class AddProductButton extends StatelessWidget {
  const AddProductButton({super.key});

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<SideMenuProvider>(context);

    return Consumer<SideMenuProvider>(
      builder: (_, provider, __) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width < 600
            ? MediaQuery.of(context).size.width * 0.33
            : MediaQuery.of(context).size.width < 1200
                ? MediaQuery.of(context).size.width * 0.25
                : MediaQuery.of(context).size.width * 0.15,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.lightBrownColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            provider.selectScreen(1,
                isEdit: false,
                passedAttributes: ProductModel(
                    barcode: 0,
                    name: "",
                    pictureName: "",
                    categoryName: " ",
                    discountedPrice: 0,
                    price: 0,
                    isOutlet: false,
                    sizes: "",
                    stock: 0));
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Flexible(
                  child: Icon(Icons.add_circle_outline, color: Colors.white)),
              const SizedBox(width: 5),
              Text('Add Product', style: AppStyles.styleRegular25(context)),
            ],
          ),
        ),
      ),
    );
  }
}
