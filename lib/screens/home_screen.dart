import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:vegan_admin_panel/consts/colors.dart';
import 'package:vegan_admin_panel/controllers/MenuController.dart';
import 'package:vegan_admin_panel/provider/side_menu_provider.dart';
import 'package:vegan_admin_panel/widgets/side_menu_drawer.dart';
import '../consts/responsive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    SidebarXController controller =
        SidebarXController(selectedIndex: selectedIndex);
    return ChangeNotifierProvider(
      create: (_) => SideMenuProvider(),
      child: Consumer<SideMenuProvider>(
        builder: (context, sideMenuProvider, child) => Scaffold(
          backgroundColor: AppColors.whiteColor,
          key: context.read<MyMenuController>().getScaffoldKey,
          drawer: SideBarXExample(controller: controller),
          body: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // We want this side menu only for large screen
                if (Responsive.isWeb(context))
                  SideBarXExample(controller: controller),
                Expanded(
                    // It takes 5/6 part of the screen
                    flex: 5,
                    child: SideMenuProvider.selectedWidget),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
