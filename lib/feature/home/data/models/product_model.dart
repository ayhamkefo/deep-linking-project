class ProductModel {
  final String id;
  final String name;
  final double price;
  final String description;
  final String shareLink;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.shareLink,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price']?.toDouble() ?? 0.0,
      description: json['description'],
      shareLink: json['shareLink'],
    );
  }

  // Generate deep link using custom scheme
  String get deepLink => 'productapp://product/$id';

  // Generate universal link
  String get universalLink => shareLink;
}
