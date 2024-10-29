import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:vegan_admin_panel/consts/app_styles.dart';
import 'package:vegan_admin_panel/provider/order_provider.dart';
import 'package:vegan_admin_panel/screens/ordersScreen/active_order_screen.dart';
import 'package:vegan_admin_panel/screens/ordersScreen/all_orders_screen.dart';
import 'package:vegan_admin_panel/screens/ordersScreen/completed_order_screen.dart';
import 'package:vegan_admin_panel/widgets/tab_bar.dart';

import '../../widgets/app_bar.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersProvider provider = Provider.of<OrdersProvider>(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: myAppBar(
          context: context,
          title: 'Orders',
          tabBarCheck: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderRow(context),
              const SizedBox(height: 30),
              MyTabBar(provider: provider),
              const Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    AllOrdersScreen(),
                    ActiveOrdersScreen(),
                    CompletedOrdersScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderRow(BuildContext context) {
    return Row(
      children: [
        Text('Manage Orders', style: AppStyles.styleRegular20(context)),
        const Spacer(),
        _buildOutlinedButton(
          context,
          label: 'Add Order',
          icon: IconlyBroken.plus,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildOutlinedButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width < 600
          ? MediaQuery.of(context).size.width * 0.33
          : MediaQuery.of(context).size.width < 1200
              ? MediaQuery.of(context).size.width * 0.22
              : MediaQuery.of(context).size.width * 0.15,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide.none,
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(icon, color: textColor),
            const SizedBox(width: 5),
            Text(label, style: AppStyles.styleRegular14(context)),
          ],
        ),
      ),
    );
  }
}
