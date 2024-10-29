import 'package:flutter/material.dart';
import 'package:vegan_admin_panel/consts/app_styles.dart';
import 'package:vegan_admin_panel/consts/colors.dart';

import 'package:vegan_admin_panel/widgets/add_product_button.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: const AssetImage('assets/random/box.png'),
            height: MediaQuery.of(context).size.width * 0.2,
            width: MediaQuery.of(context).size.width * 0.2,
          ),
          const SizedBox(height: 10),
          Text(
            'Whoops!',
            style: AppStyles.styleRegular30(context)
                .copyWith(color: AppColors.redColor),
          ),
          const SizedBox(height: 10),
          Text(
            'No Products Available to show',
            style: AppStyles.styleRegular20(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const AddProductButton(), // Assuming AddProductButton is stateless
        ],
      ),
    );
  }
}
