class ProductModel {
  final String title;
  final String image;
  final double price;
  final String description;

  const ProductModel(
      {required this.title,
      required this.price,
      required this.description,
      required this.image});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        title: json['name'],
        price: json['price'],
        image: json['image'] ,
        description: json['description']);
  }
}
