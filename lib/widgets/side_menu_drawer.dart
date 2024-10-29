import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:vegan_admin_panel/consts/app_styles.dart';
import 'package:vegan_admin_panel/consts/colors.dart';
import 'package:vegan_admin_panel/provider/side_menu_provider.dart';

class SideBarXExample extends StatelessWidget {
  const SideBarXExample({super.key, required SidebarXController controller})
      : _controller = controller;
  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return Consumer<SideMenuProvider>(
      builder: (context, sideMenuProvider, child) {
        return SidebarX(
          controller: _controller,
          theme: _sidebarTheme(AppStyles.styleRegular20(context)),
          extendedTheme:
              _extendedSidebarTheme(AppStyles.styleRegular20(context)),
          footerDivider: const Divider(color: Colors.grey, height: 1),
          headerBuilder: (context, extended) => _buildHeader(extended),
          items: _buildSidebarItems(sideMenuProvider),
        );
      },
    );
  }

  SidebarXTheme _sidebarTheme(TextStyle textStyle) {
    return SidebarXTheme(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      hoverColor: AppColors.lightBrownColor,
      textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
      selectedTextStyle: const TextStyle(color: Colors.white),
      hoverTextStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      itemTextPadding: const EdgeInsets.only(left: 30),
      selectedItemTextPadding: const EdgeInsets.only(left: 30),
      itemDecoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.lightWhiteColor),
      ),
      selectedItemDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.lightWhiteColor,
        ),
        gradient: const LinearGradient(
          colors: [AppColors.lightBrownColor, AppColors.brownColor],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.28),
            blurRadius: 30,
          )
        ],
      ),
      iconTheme: const IconThemeData(
          color: AppColors.brownColor, size: 20, weight: 60),
      selectedIconTheme: const IconThemeData(
        color: AppColors.whiteColor,
        size: 20,
      ),
    );
  }

  SidebarXTheme _extendedSidebarTheme(TextStyle textStyle) {
    return SidebarXTheme(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: 250,
      selectedItemDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        gradient: const LinearGradient(
          colors: [AppColors.lightBrownColor, AppColors.brownColor],
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 30,
          ),
        ],
      ),
      selectedIconTheme: const IconThemeData(color: Colors.white),
      textStyle: textStyle,
    );
  }

  Widget _buildHeader(bool extended) {
    final imageAsset = extended ? 'assets/logo.png' : 'assets/logo.png';
    final height = extended ? 225.0 : 150.0;

    return SizedBox(
      height: height,
      child: Image.asset(imageAsset, fit: BoxFit.contain),
    );
  }

  List<SidebarXItem> _buildSidebarItems(SideMenuProvider sideMenuProvider) {
    return [
      SidebarXItem(
        icon: (Icons.inventory_2_outlined),
        label: 'Products',
        onTap: () => sideMenuProvider.selectScreen(0),
      ),
      SidebarXItem(
        icon: IconlyLight.buy,
        label: 'Orders',
        onTap: () => sideMenuProvider.selectScreen(2),
      ),
    ];
  }
}
