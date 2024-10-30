import 'package:flutter/material.dart';
import 'package:vegan_admin_panel/consts/colors.dart';
import 'package:vegan_admin_panel/consts/responsive.dart';
import 'package:vegan_admin_panel/screens/auth/Login/components/mobile_screen.dart';
import 'package:vegan_admin_panel/screens/auth/components/background.dart';

import 'components/login_form.dart';
import 'components/login_screen_top_image.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: AppColors.brownColor,
            scaffoldBackgroundColor: Colors.white,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                foregroundColor: AppColors.whiteColor,
                backgroundColor: AppColors.brownColor,
                shape: const StadiumBorder(),
                maximumSize: const Size(double.infinity, 56),
                minimumSize: const Size(double.infinity, 56),
              ),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              iconColor: AppColors.brownColor,
              fillColor: AppColors.whiteColor,
              prefixIconColor: AppColors.brownColor,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: AppColors.defaultPadding,
                  vertical: AppColors.defaultPadding),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
            )),
        home: const Scaffold(
          body: Background(
            child: SingleChildScrollView(
              child: Responsive(
                mobile: MobileLoginScreen(),
                web: Row(
                  children: [
                    Expanded(
                      child: LoginScreenTopImage(),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 450,
                            child: LoginForm(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                tablet: MobileLoginScreen(),
              ),
            ),
          ),
        ));
  }
}
