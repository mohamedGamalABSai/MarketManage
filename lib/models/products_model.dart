import 'package:json_annotation/json_annotation.dart';
part 'products_model.g.dart';

@JsonSerializable()
class ProductModel {
  final String name, pictureName, categoryName;
  final double price, discountedPrice;
  final double? campaignDiscountedPrice;
  final bool isOutlet;
  final int stock, barcode;
  final String sizes;

  ProductModel({
    required this.barcode,
    required this.name,
    required this.pictureName,
    required this.categoryName,
    this.campaignDiscountedPrice = 0.0,
    required this.discountedPrice,
    required this.price,
    required this.isOutlet,
    required this.sizes,
    required this.stock,
  });

  factory ProductModel.fromJson(Map<String, dynamic>? json) =>
      _$ProductModelFromJson(json!);
}
