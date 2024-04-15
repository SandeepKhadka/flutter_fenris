import 'package:get/get.dart';
import 'package:keyboard/controller/cart_controller.dart';
import 'package:keyboard/model/getProducts_model.dart';

class WishlistController extends GetxController {
  RxList<GetProducts> wishlist = RxList<GetProducts>();
  RxList<GetProducts> cart = RxList<GetProducts>();
  // static CartController get to => Get.find<CartController>();

  bool isInWishlist(GetProducts product) {
    return wishlist.contains(product);
  }

  bool isInCart(GetProducts product) {
    return cart.contains(product);
  }

  void addToWishlist(GetProducts product) {
    wishlist.add(product);
  }

  void addTocart(GetProducts product) {
    cart.add(product);
  }

  void removeFromWishlist(GetProducts product) {
    wishlist.remove(product);
  }

  void removeFromCart(GetProducts product) {
    cart.remove(product);
  }
}
