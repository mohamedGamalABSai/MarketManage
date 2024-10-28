import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../models/orders_model/order_model.dart';

class OrdersProvider with ChangeNotifier {

  List<OrderModel> orders = [];
  List<OrderModel> activeOrders = [];
  List<OrderModel> cancelledOrders = [];
  List<OrderModel> completedOrders = [];
  bool loadingOrders = false;

  Future<void> getMyOrders() async {
    loadingOrders = true;
    notifyListeners();
    await FirebaseFirestore.instance.collection('Orders').get().then((value) {
      orders = [];
      activeOrders = [];
      cancelledOrders = [];
      completedOrders = [];
      for (var element in value.docs) {
        orders.add(OrderModel.fromJson(element.data()));
          if(element.data()['status'] == 'Active'){
            activeOrders.add(OrderModel.fromJson(element.data()));
          }else if(element.data()['status'] == 'Completed'){
            completedOrders.add(OrderModel.fromJson(element.data()));
          }else if(element.data()['status'] == 'Cancelled'){
            cancelledOrders.add(OrderModel.fromJson(element.data()));
          }
        }
    });
    loadingOrders = false;
    notifyListeners();
  }


  Future<void> createNewOrder({
    required String orderId,
    required int quantity,
    required double totalPrice,
    required String status,
  }) async {
    OrderModel orderModel = OrderModel(
        orderId: orderId,
        userUid:'',
        totalPrice: totalPrice,
        quantity: quantity,
        status: status,
        createdAt: DateFormat('dd/MM/yyyy kk:mm ').format(DateTime.now()),
    );
    await FirebaseFirestore.instance.collection('Orders')
        .doc(orderId)
        .set(orderModel.toMap());
  }
}