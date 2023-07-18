import 'package:nike_app_clone/models/product_model.dart';

class CartModel {
  final ProductModel product;
  int quantity;
  double totalPrice;
  CartModel(
      {required this.product,
      required this.quantity,
      required this.totalPrice});
}
