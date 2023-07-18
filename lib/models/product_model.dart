class ProductModel {
  final String category;
  final String type;
  final String name;

  final double price;
  final String imageUrl;
  bool isFavorite;

  ProductModel(
      {required this.category,
      required this.name,
      required this.type,
      required this.price,
      required this.imageUrl,
      this.isFavorite = false});
}
