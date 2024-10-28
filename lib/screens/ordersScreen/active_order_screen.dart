import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegan_admin_panel/widgets/OrdersDataTable.dart';

import '../../../provider/order_provider.dart';

class ActiveOrdersScreen extends StatelessWidget {
  const ActiveOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrdersProvider>(
      builder: (_, provider, child) {
        return OrdersDataTable(ordersData: provider.activeOrders);
      },
    );
  }
}
