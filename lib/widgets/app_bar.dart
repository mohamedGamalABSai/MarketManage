import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:vegan_admin_panel/consts/colors.dart';
import 'package:vegan_admin_panel/screens/auth/Login/login_screen.dart';
import 'package:vegan_admin_panel/screens/auth/Login/provider/login_provider.dart';
import 'package:vegan_admin_panel/widgets/profile_card.dart';
import 'package:vegan_admin_panel/widgets/search_feild.dart';

import '../consts/responsive.dart';

PreferredSizeWidget myAppBar({
  required BuildContext context,
  required String title,
  required bool tabBarCheck,
}) {
  final authProvider = Provider.of<AuthProvider>(context, listen: false);

  return AppBar(
    elevation: 20,
    surfaceTintColor: AppColors.whiteColor,
    backgroundColor: AppColors.whiteColor,
    toolbarHeight: 75,
    actions: [
      if (!Responsive.isWeb(context))
        IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: const Icon(Icons.menu_rounded),
        )
      else
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      const SizedBox(width: 15),
      if (Responsive.isWeb(context)) const Spacer(flex: 2),
      const Spacer(flex: 1),
      SearchField(),
      const SizedBox(width: 25),
      _buildProfileMenu(authProvider),
      const SizedBox(width: 25),
    ],
  );
}

Widget _buildProfileMenu(AuthProvider authprovider) {
  return PopupMenuButton<dynamic>(
    color: Colors.white,
    surfaceTintColor: Colors.white,
    elevation: 20,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    position: PopupMenuPosition.under,
    itemBuilder: (context) => <PopupMenuEntry<dynamic>>[
      PopupMenuItem(
        child: _buildProfileHeader(),
      ),
      // _buildMenuDivider(),
      PopupMenuItem(
        child: ProfileCard(
          title: 'Account Settings',
          leading: IconlyBroken.setting,
          onTap: () {},
        ),
      ),

      PopupMenuItem(
        child: Column(
          children: [
            _buildMenuDivider(),
            const SizedBox(height: 10),
            ProfileCard(
              title: 'Logout',
              leading: Icons.logout,
              onTap: () {
                authprovider.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const LoginScreen();
                }));
              },
            ),
          ],
        ),
      ),
    ],
    child: _buildProfileIcon(),
  );
}

Widget _buildProfileIcon() {
  return Container(
    height: 40,
    width: 40,
    decoration: BoxDecoration(
      image: const DecorationImage(
        image: AssetImage('assets/landing/buy-on-laptop.jpg'),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
  );
}

Widget _buildProfileHeader() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            _buildProfileIcon(),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Omar Sherif Metwaly',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Omarsherifmetwaly@gmail.com',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ],
        ),
      ),
      _buildMenuDivider(),
    ],
  );
}

Widget _buildMenuDivider() {
  return Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey[300],
  );
}
