import 'package:get/get.dart';
import 'package:keyboard/controller/wishlist_controller.dart';
import 'package:keyboard/model/getProducts_model.dart';

class CartController extends GetxController {
  RxList<GetProducts> cartItems = RxList<GetProducts>();
  static CartController get to => Get.find<CartController>();

  bool isInCart(GetProducts product) {
    return cartItems.contains(product);
  }

  void addToCart(GetProducts product) {
    cartItems.add(product);
  }

  void removeFromCart(GetProducts product) {
    cartItems.remove(product);
  }
}
