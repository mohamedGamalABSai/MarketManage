// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      barcode: (json['Id'] as num).toInt(),
      name: json['Name'] as String,
      pictureName: json['PictureName'] as String,
      categoryName: json['CategoryName'] as String,
      campaignDiscountedPrice:
          (json['CampaignDiscountedPrice'] as num?)?.toDouble() ?? 0.0,
      discountedPrice: (json['DiscountedPrice'] as num).toDouble(),
      price: (json['Price'] as num).toDouble(),
      isOutlet: json['IsOutlet'] as bool,
      sizes: json['Sizes'] as String,
      stock: (json['Stock'] as num).toInt(),
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
