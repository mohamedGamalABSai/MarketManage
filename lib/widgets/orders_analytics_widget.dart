import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrdersAnalytics extends StatelessWidget {
  const OrdersAnalytics(
      {required this.count,
      required this.iconData,
      required this.title,
      super.key});

  final IconData iconData;
  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  iconData,
                  size: 20.sp,
                  color: Colors.green,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(title, style: TextStyle(fontSize: 12.sp))
              ]),
        ),
        const SizedBox(
          width: 30,
        ),
        FittedBox(
            child: Text(count.toString(),
                style:
                    TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold))),
      ],
    );
  }
}

List<OrdersAnalytics> ordersAnalytics = [
  OrdersAnalytics(
    title: 'New Orders',
    iconData: IconlyLight.bag2,
    count: 84,
  ),
  OrdersAnalytics(
    title: 'Out for Delivery',
    iconData: Icons.delivery_dining_outlined,
    count: 125,
  ),
  OrdersAnalytics(
    title: 'Delivered',
    iconData: Icons.delivery_dining_outlined,
    count: 458,
  ),
  OrdersAnalytics(
    title: 'Cancelled',
    iconData: Icons.cancel_outlined,
    count: 56,
  ),
];
