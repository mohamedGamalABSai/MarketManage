import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/order_provider.dart';
import '../../widgets/OrdersDataTable.dart';

class CancelledOrdersScreem extends StatelessWidget {
  const CancelledOrdersScreem({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrdersProvider>(
      builder: (_, provider, child) => OrdersDataTable(ordersData: provider.cancelledOrders,)
      );
  }
}
