// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      orderId: json['orderId'] as String?,
      userUid: json['userUid'] as String?,
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      quantity: (json['quantity'] as num?)?.toInt(),
      status: json['status'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'userUid': instance.userUid,
      'totalPrice': instance.totalPrice,
      'quantity': instance.quantity,
      'status': instance.status,
      'createdAt': instance.createdAt,
    };
