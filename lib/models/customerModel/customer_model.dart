import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import '../addressModel/address_model.dart';
import '../cartModel/cart_model.dart';
import '../wishlistModel/wishlist_model.dart';

part 'customer_model.g.dart';
@JsonSerializable()
class CustomerModel with ChangeNotifier{
  String? customerUID;
  String? fullName;
  String? emailAddress;
  String? phoneNumber;
  List<ShippingAddress>? shippingAddresses;
  List <CartModel>? inCartList ;
  List <WishlistModel>? inWishList ;
  String? imageUrl;
  String? createdAt;
  String? loginType;
  int? totalSpent;

  CustomerModel(
      {
        required this.customerUID,
        required this.fullName,
        required this.emailAddress,
        required this.phoneNumber,
        required this.imageUrl,
        required this.createdAt,
        required this.loginType,
        required this.shippingAddresses,
        required this.inCartList,
        required this.inWishList,
        required this.totalSpent,
      });

  factory CustomerModel.fromJson(Map<String, dynamic>? json) => _$CustomerModelFromJson(json!);

  Map<String, dynamic> toMap () => _$CustomerModelToJson(this);

//   CustomerModel.fromJson(Map<String, dynamic> json){
//     customerUID        = json['customerUID'];
//     fullName           = json['fullName'];
//     emailAddress       = json['emailAddress'];
//     phoneNumber        = json['phoneNumber'];
//     imageUrl           = json['imageUrl'];
//     createdAt          = json['createdAt'];
//     loginType          = json['loginType'];
//     shippingAddresses  = json['shippingAddresses'];
//     inCartList         = json['inCartList'];
//     inWishList         = json['inWishList'];
//   }
//
//   Map<String, dynamic> toMap (){
//     return {
//       'customerUID'      :customerUID,
//       'fullName'         :fullName,
//       'emailAddress'     :emailAddress,
//       'phoneNumber'      :phoneNumber,
//       'imageUrl'         :imageUrl,
//       'createdAt'        :createdAt,
//       'loginType'        :loginType,
//       'shippingAddresses':shippingAddresses,
//       'inCartList'       :inCartList,
//       'inWishList'       :inWishList
//     };
// }
}

// class ShippingAddress {
//     String? name;
//     String? streetAddress;
//     String? cityName;
//     String? countryName;
//     String? postCode;
//
//   ShippingAddress(
//       {
//         required this.name,
//         required this.streetAddress,
//         required this.cityName,
//         required this.countryName,
//         required this.postCode,
//       });
//
//     ShippingAddress.fromJson(Map<String, dynamic> json){
//       name = json['name'];
//       streetAddress = json['streetAddress'];
//       cityName = json['cityName'];
//       countryName = json['countryName'];
//       postCode = json['postCode'];
//     }
//     Map<String, dynamic> toMap () {
//       return {
//         'name': name,
//         'streetAddress': streetAddress,
//         'cityName': cityName,
//         'countryName': countryName,
//         'postCode': postCode,
//       };
//     }
// }
