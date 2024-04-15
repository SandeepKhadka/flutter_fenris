import 'package:get/get.dart';
import '../model/userDetails.dart';

class UserController extends GetxController {
  late User user = User(
    id: -1,
    name: '',
    email: '',
    emailVerifiedAt: null,
    phone: '',
    status: '',
    role: '',
    image: null,
    activationToken: null,
    tokenValidate: null,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  Future<void> setUser(Map<String, dynamic> userData) async {
    user = User.fromJson(userData);
    update(); // Notify listeners that the user object has been updated
  }

  String get userName => user.name;
  String get phone => user.phone;
  String get email => user.email;
  int get id => user.id;
}
