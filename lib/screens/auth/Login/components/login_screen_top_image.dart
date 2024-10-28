import 'package:flutter/material.dart';
import 'package:vegan_admin_panel/consts/app_styles.dart';
import 'package:vegan_admin_panel/consts/colors.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "LOGIN",
          style: AppStyles.styleRegular30(context),
        ),
        const SizedBox(height: AppColors.defaultPadding * 2),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: Image.asset("assets/images/sign_in.jpeg"),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: AppColors.defaultPadding * 2),
      ],
    );
  }
}
