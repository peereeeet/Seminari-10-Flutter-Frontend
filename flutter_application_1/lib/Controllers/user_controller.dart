import 'package:ea_seminari_9/Models/user.dart';
import 'package:ea_seminari_9/Services/user_services.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  var userList = <User>[].obs;
  var selectedUser = Rxn<User>();
 final UserServices _userServices;

  UserController(this._userServices);
  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      var users = await _userServices.fetchUsers(); 
      if (users.isNotEmpty) {
        userList.assignAll(users);
      }
    } finally {
      isLoading(false);
    }
  }
  fetchUserById(String id) async{
    try {
      isLoading(true);
      var user = await _userServices.fetchUserById(id);
      selectedUser.value = user;
      }
      catch(e){
        Get.snackbar(
        "Error al cargar",
        "No se pudo encontrar el usuario: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }
}