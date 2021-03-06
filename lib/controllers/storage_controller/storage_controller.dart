import 'package:aidber/models/auth/login_model.dart';
import 'package:aidber/screens/auth/login/login_view.dart';
import 'package:aidber/utils/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:aidber/utils/get_di.dart' as di;

import '../../utils/get_di.dart';
class storage_controller extends GetxController implements GetxService {
  LoginModel userModel = LoginModel();
  final box = GetStorage(constans.STORAGE_NAME);

  String? getProfileImage() {
    return userModel.result?.userImage;
  }

  String? getUserName() {
    return userModel.result?.userName;
  }

  int? getUserId() {
    return userModel.result?.userId;
  }

  Future<void> initStorage() async {
    await GetStorage.init(constans.STORAGE_NAME);
  }

  Future<void> storeLoginModel(LoginModel loginModel) async {
    await box.write("login_model", loginModel.toJson());
    await box.write("token", loginModel.result?.token.toString());
    print("storing");
    await Future.delayed(const Duration(milliseconds: 200));
    userModel = loginModel;
    update();
  }

  LoginModel? restoreLoginModel() {
    final map = box.read('login_model');
    if (map == null) {
      return null;
    }
    userModel = LoginModel.fromJson(map);
    print("TOKEN: \n" + userModel.result!.token.toString());
    return userModel;
  }

  Future<void> clear_storage() async {
    await box.erase();
    await box.remove("token");
    userModel = LoginModel();
    Get.offAll(const Sign_In2());


  }
}