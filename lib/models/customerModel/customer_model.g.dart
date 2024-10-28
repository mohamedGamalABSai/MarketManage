// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    CustomerModel(
      customerUID: json['customerUID'] as String?,
      fullName: json['fullName'] as String?,
      emailAddress: json['emailAddress'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      imageUrl: json['imageUrl'] as String?,
      createdAt: json['createdAt'] as String?,
      loginType: json['loginType'] as String?,
      shippingAddresses: (json['shippingAddresses'] as List<dynamic>?)
          ?.map((e) => ShippingAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      inCartList: (json['inCartList'] as List<dynamic>?)
          ?.map((e) => CartModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      inWishList: (json['inWishList'] as List<dynamic>?)
          ?.map((e) => WishlistModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalSpent: (json['totalSpent'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'customerUID': instance.customerUID,
      'fullName': instance.fullName,
      'emailAddress': instance.emailAddress,
      'phoneNumber': instance.phoneNumber,
      'shippingAddresses': instance.shippingAddresses,
      'inCartList': instance.inCartList,
      'inWishList': instance.inWishList,
      'imageUrl': instance.imageUrl,
      'createdAt': instance.createdAt,
      'loginType': instance.loginType,
      'totalSpent': instance.totalSpent,
    };
