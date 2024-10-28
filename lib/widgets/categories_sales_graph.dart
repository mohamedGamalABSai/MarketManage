// import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:vegan_admin_panel/consts/responsive.dart';
//
// class CategoriesSalesGraph extends StatelessWidget {
//   const CategoriesSalesGraph({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.symmetric(vertical: 16.0),
//         child: Container(
//             width: Responsive.isDesktop(context) ? (MediaQuery.sizeOf(context).width-280) * 0.5: (MediaQuery.sizeOf(context).width - 75) * 0.5,    // This will take 20% of the screen's width
//             height: 36.h,
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(15)
//             ),
//             padding: const EdgeInsets.all(20),
//             child: SfCircularChart(
//               borderWidth: Adaptive.w(0.2),
//               title: const ChartTitle(text: 'Most Selling Categories',alignment: ChartAlignment.near),
//               legend: const Legend(isVisible: true,alignment: ChartAlignment.center),
//               series: [
//                 PieSeries<CategoryAnalysis, String>(
//                   dataSource: categoriesChart,
//                   xValueMapper: (CategoryAnalysis data, _) => data.categoryName,
//                   yValueMapper: (CategoryAnalysis data, _) => data.salesRatio,
//                 )
//               ],
//             )
//         ));
//   }
// }
//
// class CategoryAnalysis{
//
//   CategoryAnalysis(this.categoryName, this.salesRatio);
//
//   String categoryName;
//   int salesRatio;
// }
//
// List<CategoryAnalysis> categoriesChart = [
//   CategoryAnalysis('Vegetables', 20),
//   CategoryAnalysis('Nuts', 15),
//   CategoryAnalysis('Fruits', 35),
//   CategoryAnalysis('grains', 15),
//   CategoryAnalysis('Spices', 15),
// ];
