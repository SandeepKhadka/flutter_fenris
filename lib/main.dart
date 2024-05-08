import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard/Login/LOgin.dart';
import 'package:keyboard/Login/Reset.dart';
import 'package:keyboard/Login/success.dart';
import 'package:keyboard/Pages/homepage.dart';
import 'package:keyboard/Providers/LoginModel.dart';
import 'package:keyboard/Screens/Splash.dart';
import 'package:keyboard/cart/my_cart_view.dart';
import 'package:keyboard/controller/Buy_Product_Controller.dart';
import 'package:keyboard/controller/authentication_controller.dart';
import 'package:keyboard/controller/cart_controller.dart';
import 'package:keyboard/controller/getCategoryController.dart';
import 'package:keyboard/controller/getProduct_controller.dart';
import 'package:keyboard/controller/get_banner_controller.dart';
import 'package:keyboard/controller/myOrders_Controller.dart';
import 'package:keyboard/controller/update_profile_Controller.dart';
import 'package:keyboard/controller/wishlist_controller.dart';
import 'package:khalti/khalti.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Khalti.init(
      publicKey: 'test_public_key_196df8c10c0743f68f66d5ded92b5157ddd',
      enabledDebugging: false);

  Get.put(ProductController());

  Get.put(AuthenticationController());
  Get.put(WishlistController());
  Get.put(CartController());
  Get.put(GetCategoryController());
  Get.put(BuyController());
  Get.put(MyOrder());
  Get.put(GetBannersController());
  Get.put(UpdateProfileController());

  runApp(const GetMaterialApp(
    // home: LoginPage(),
  ));
}
