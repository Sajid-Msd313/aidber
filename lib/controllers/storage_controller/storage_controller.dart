import 'package:aidber/models/auth/login_model.dart';
import 'package:aidber/screens/auth/login/login_view.dart';
import 'package:aidber/utils/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class storage_controller extends GetxController implements GetxService {
  LoginModel userModel = LoginModel();
  final box = GetStorage(constans.STORAGE_NAME);

  Future<void> initStorage() async {
    await GetStorage.init(constans.STORAGE_NAME);
  }

  Future<void> storeLoginModel(LoginModel loginModel) async {
    await box.write("login_model", loginModel.toJson());
    await box.write("token", loginModel.result?.token.toString());
    print("storing");
    await Future.delayed(Duration(milliseconds: 200));
    userModel = loginModel;
    update();
  }

  LoginModel? restoreLoginModel() {
    final map = box.read('login_model') ?? null;
    if (map == null) {
      return null;
    }
    userModel = LoginModel.fromJson(map);
    print("TOKEN: \n" + userModel.result!.token.toString());
    return userModel;
  }
  Future<void> clear_storage() async {
    await box.erase();
    Get.offAll(const Sign_In2());
  }

}
