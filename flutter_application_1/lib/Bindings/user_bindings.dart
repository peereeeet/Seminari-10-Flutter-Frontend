import 'package:ea_seminari_9/Controllers/user_controller.dart';
import 'package:ea_seminari_9/Services/user_services.dart';
import 'package:get/get.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut<UserServices>(() => UserServices());
     Get.lazyPut<UserController>(() => UserController(Get.find<UserServices>()));
  }
}