class ProductModel {
  String? thumbnail;
  String title;
  double price;
  String? brand;
  double rating;
  String description;
  List<dynamic> images;
  ProductModel({
    required this.brand,
    required this.description,
    required this.images,
    required this.price,
    required this.rating,
    required this.thumbnail,
    required this.title,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        brand: json["brand"],
        description: json["description"],
        images: List<String>.from(json["images"]),
        price: json["price"],
        rating: json["rating"],
        thumbnail: json["thumbnail"],
        title: json["title"]);
  }
}
