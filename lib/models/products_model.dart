import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'products_model.g.dart';
@JsonSerializable()
class ProductModel with ChangeNotifier{
   String? id;
   String? title;
   String? description;
   String? imageUrl;
   String? productCategoryName;
   double? price;
   double? salePrice;
   String? discountPercentage;
   bool isOnSale;
   String? scale;
   int? stock;

  ProductModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.productCategoryName,
    required this.price,
    required this.salePrice,
    required this.isOnSale,
    required this.discountPercentage,
    required this.scale,
    required this.stock
  });


  factory ProductModel.fromJson(Map<String, dynamic>? json) => _$ProductModelFromJson(json!);

  Map<String, dynamic> toMap () => _$ProductModelToJson(this);
}
