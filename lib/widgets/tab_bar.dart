import 'package:flutter/material.dart';

import 'package:vegan_admin_panel/provider/order_provider.dart';

class MyTabBar extends StatelessWidget {
  final OrdersProvider provider;

  const MyTabBar({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
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
      // width: 180,
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
