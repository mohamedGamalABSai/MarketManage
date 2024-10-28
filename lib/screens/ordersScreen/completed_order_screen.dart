import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/order_provider.dart';
import '../../widgets/OrdersDataTable.dart';

class CompletedOrdersScreen extends StatelessWidget {
  const CompletedOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrdersProvider>(
      builder: (_, provider, child) => OrdersDataTable(ordersData: provider.completedOrders,)
      );
  }
}
