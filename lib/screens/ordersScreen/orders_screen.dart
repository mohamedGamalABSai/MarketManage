import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:vegan_admin_panel/provider/order_provider.dart';
import 'package:vegan_admin_panel/screens/ordersScreen/active_order_screen.dart';
import 'package:vegan_admin_panel/screens/ordersScreen/all_orders_screen.dart';
import 'package:vegan_admin_panel/screens/ordersScreen/completed_order_screen.dart';

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
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderRow(context),
              const SizedBox(height: 30),
              _buildTabBar(context, provider),
              const Expanded(
                child: TabBarView(
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
        Text(
          'Manage Orders',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const Spacer(),
        _buildOutlinedButton(
          label: 'Add Order',
          icon: IconlyBroken.plus,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          onPressed: () {},
        ),
        const SizedBox(width: 10),
        _buildOutlinedButton(
          label: 'Filter',
          icon: IconlyBroken.filter2,
          backgroundColor: Colors.white,
          textColor: Colors.grey,
          onPressed: () {},
        ),
        const SizedBox(width: 10),
        _buildOutlinedButton(
          label: 'Export',
          icon: IconlyBroken.paperDownload,
          backgroundColor: Colors.white,
          textColor: Colors.grey,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildOutlinedButton({
    required String label,
    required IconData icon,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        fixedSize: const Size(120, 40),
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
          Text(label, style: TextStyle(color: textColor)),
        ],
      ),
    );
  }

  Widget _buildTabBar(BuildContext context, OrdersProvider provider) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[100],
      child: TabBar(
        tabs: _buildTabs(provider),
        indicatorPadding: EdgeInsets.zero,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 5,
        indicatorColor: Colors.green,
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.black,
        isScrollable: true,
      ),
    );
  }

  List<Widget> _buildTabs(OrdersProvider provider) {
    return [
      _buildTab(label: 'All Orders', count: provider.orders.length),
      _buildTab(label: 'Active Orders', count: provider.activeOrders.length),
      _buildTab(
          label: 'Pending Orders', count: provider.completedOrders.length),
      _buildTab(
          label: 'Cancelled Orders', count: provider.cancelledOrders.length),
    ];
  }

  Widget _buildTab({required String label, required int count}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 11),
      width: 180,
      alignment: AlignmentDirectional.center,
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(width: 10),
          Container(
            width: 25,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              '$count',
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
