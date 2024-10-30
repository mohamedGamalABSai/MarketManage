import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegan_admin_panel/consts/app_styles.dart';
import 'package:vegan_admin_panel/consts/colors.dart';
import '../../provider/side_menu_provider.dart';

class AddProductButton extends StatelessWidget {
  const AddProductButton({super.key});

  @override
  Widget build(BuildContext context) {
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
          onPressed: () {},
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
