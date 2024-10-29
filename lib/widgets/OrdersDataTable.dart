import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:vegan_admin_panel/models/orders_model/order_model.dart';

import 'package:intl/intl.dart';

class OrdersDataTable extends StatelessWidget {
  const OrdersDataTable({super.key, required this.ordersData});

  final List<OrderModel> ordersData;

  @override
  Widget build(BuildContext context) {
    String formatDateString(String dateString) {
      // Parse the date string into a DateTime object
      DateTime dateTime = DateTime.parse(dateString);

      // Format the DateTime object to the desired format
      String formattedDate = DateFormat('dd MMMM HH:MM').format(dateTime);

      return formattedDate;
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: SizedBox(
            child: DataTable(
                dividerThickness: 0,
                showCheckboxColumn: true,
                sortColumnIndex: 1,
                checkboxHorizontalMargin: 15,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                columns: [
                  DataColumn(
                      label: Text('Order ID',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13.sp),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis)),
                  DataColumn(
                      label: Text('Date Placed',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13.sp),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis)),
                  DataColumn(
                      label: Text('Quantity',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13.sp),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis)),
                  DataColumn(
                      label: Text('Total Price',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13.sp),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis)),
                  DataColumn(
                      label: Text('Paid',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13.sp),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis)),
                  DataColumn(
                      label: Text('Status',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13.sp),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis)),
                ],
                rows: List.generate(
                    ordersData.length,
                    (index) => DataRow(cells: [
                          DataCell(Text('#${ordersData[index].orderId}',
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 13.sp),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis)),
                          DataCell(Text(
                              formatDateString(ordersData[index].createdAt!),
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 13.sp),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis)),
                          DataCell(Text('${ordersData[index].quantity}',
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 13.sp),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis)),
                          DataCell(Text('${ordersData[index].totalPrice} EGP',
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 13.sp),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis)),
                          DataCell(Icon(Icons.check,
                              color: Colors.grey[600], size: 13.sp)),
                          DataCell(Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ordersData[index].status == 'Active'
                                    ? Colors.green
                                    : ordersData[index].status == 'Completed'
                                        ? Colors.orange
                                        : Colors.red),
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text('${ordersData[index].status}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13.sp)),
                          ))
                        ])))),
      ),
    );
  }
}
