// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      imageUrl: json['imageUrl'] as String?,
      description: json['description'] as String?,
      productCategoryName: json['productCategoryName'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      salePrice: (json['salePrice'] as num?)?.toDouble(),
      isOnSale: json['isOnSale'] as bool,
      discountPercentage: json['discountPercentage'] as String?,
      scale: json['scale'] as String?,
      stock: (json['stock'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'productCategoryName': instance.productCategoryName,
      'price': instance.price,
      'salePrice': instance.salePrice,
      'discountPercentage': instance.discountPercentage,
      'isOnSale': instance.isOnSale,
      'scale': instance.scale,
      'stock': instance.stock,
    };
