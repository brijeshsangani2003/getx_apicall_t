import 'package:get/get.dart';
import 'package:getx_apicall_t/model/user_model.dart';
import 'package:getx_apicall_t/repositories/services.dart';

class UserController extends GetxController {
  var isLoading = true;
  List<UserModel> userList = [];

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  void getUserData() async {
    isLoading = true;

    final userResponse = await ApiServices().user();
    if (userResponse != null) {
      userList.assignAll(userResponse);
    }

    isLoading = false;
    update();
  }
}
