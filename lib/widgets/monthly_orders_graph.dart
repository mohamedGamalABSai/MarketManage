// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
//
// class MonthlyOrdersGraph extends StatelessWidget {
//   MonthlyOrdersGraph({super.key});
//
//   final List<OrdersAnalysis> ordersAnalysis = [
//     OrdersAnalysis(1, 95),
//     OrdersAnalysis(2, 23),
//     OrdersAnalysis(3, 19),
//     OrdersAnalysis(4, 45),
//     OrdersAnalysis(5, 56),
//     OrdersAnalysis(6, 150),
//     OrdersAnalysis(7, 175),
//
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.symmetric(vertical: 16.0),
//         child: Container(
//             width: double.infinity,
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(15)
//             ),
//             padding: const EdgeInsets.all(20),
//             child: SfCartesianChart(
//               title: const ChartTitle(text: 'Orders Monthly',alignment: ChartAlignment.near),
//               legend: const Legend(isVisible: true,alignment: ChartAlignment.near),
//               series: <AreaSeries<OrdersAnalysis, int>>[
//                 AreaSeries<OrdersAnalysis, int>(
//                   // Bind data source
//                     dataSource: ordersAnalysis,
//                     xValueMapper: (OrdersAnalysis sales, _) => sales.month,
//                     yValueMapper: (OrdersAnalysis sales, _) => sales.ordersNo,
//                   enableTooltip: true,
//                   legendItemText: 'Monthly Sales',
//                 )
//               ],
//             )
//         )
//     );
//   }
// }
//
// class OrdersAnalysis{
//
//   num ordersNo;
//   int month;
//
//   OrdersAnalysis(this.month, this.ordersNo,);
// }
//
