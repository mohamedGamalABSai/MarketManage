import 'package:flutter/material.dart';
import 'package:vegan_admin_panel/test/Screens/Login/components/login_form.dart';
import 'package:vegan_admin_panel/test/Screens/Login/components/login_screen_top_image.dart';

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        LoginScreenTopImage(),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginForm(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
