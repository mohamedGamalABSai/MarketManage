// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      barcode: (json['barcode'] as num).toInt(),
      name: json['name'] as String,
      pictureName: json['pictureName'] as String,
      categoryName: json['categoryName'] as String,
      campaignDiscountedPrice:
          (json['campaignDiscountedPrice'] as num?)?.toDouble() ?? 0.0,
      discountedPrice: (json['discountedPrice'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      isOutlet: json['isOutlet'] as bool,
      sizes: json['sizes'] as String,
      stock: (json['stock'] as num).toInt(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'pictureName': instance.pictureName,
      'categoryName': instance.categoryName,
      'price': instance.price,
      'discountedPrice': instance.discountedPrice,
      'campaignDiscountedPrice': instance.campaignDiscountedPrice,
      'isOutlet': instance.isOutlet,
      'stock': instance.stock,
      'barcode': instance.barcode,
      'sizes': instance.sizes,
    };
