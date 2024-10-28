class Product {
  final String name;
  final double price;
  final double discountedPrice;
  final double? campaignDiscountedPrice;
  final List<String> sizes;
  final int stock;
  final String pictureName;
  final bool isOutlet;
  final String categoryName;
  final int id;

  Product({
    required this.name,
    required this.price,
    required this.discountedPrice,
    this.campaignDiscountedPrice,
    required this.sizes,
    required this.stock,
    required this.pictureName,
    required this.isOutlet,
    required this.categoryName,
    required this.id,
  });

  // Factory method to create a Product instance from JSON data
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['Name'],
      price: json['Price'].toDouble(),
      discountedPrice: json['DiscountedPrice'].toDouble(),
      campaignDiscountedPrice: json['CampaignDiscountedPrice'] != null
          ? json['CampaignDiscountedPrice'].toDouble()
          : null,
      sizes: (json['Sizes'] as String)
          .replaceAll(RegExp(r"[\[\]']"), "")
          .split(', ')
          .map((size) => size.trim())
          .toList(),
      stock: json['Stock'],
      pictureName: json['PictureName'],
      isOutlet: json['IsOutlet'],
      categoryName: json['CategoryName'],
      id: json['Id'],
    );
  }

  // Convert a Product instance to JSON format if needed
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Price': price,
      'DiscountedPrice': discountedPrice,
      'CampaignDiscountedPrice': campaignDiscountedPrice,
      'Sizes': sizes,
      'Stock': stock,
      'PictureName': pictureName,
      'IsOutlet': isOutlet,
      'CategoryName': categoryName,
      'Id': id,
    };
  }
}
