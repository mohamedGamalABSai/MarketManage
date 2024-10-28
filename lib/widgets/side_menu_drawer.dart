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
      width: 75,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      iconTheme: const IconThemeData(color: AppColors.brownColor),
      textStyle: textStyle,
      selectedTextStyle: const TextStyle(color: Colors.white),
      itemTextPadding: const EdgeInsets.only(left: 30),
      selectedItemTextPadding: const EdgeInsets.only(left: 30),
      selectedIconTheme: const IconThemeData(color: Colors.white),
      selectedItemDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white30),
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
        icon: Icons.inventory_2_outlined,
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
