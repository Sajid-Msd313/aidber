import 'package:aidber/controllers/storage_controller/storage_controller.dart';
import 'package:aidber/menu/navigation_bar/bottom_nav_bar_custom.dart';
import 'package:aidber/models/auth/login_model.dart';
import 'package:aidber/screens/home_screen/home_screen_view.dart';
import 'package:aidber/services/auth/signin_services.dart';
import 'package:aidber/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class signin_controller extends GetxController {
  bool isLoading = false;
  TextEditingController emailTextEditingController = TextEditingController(text: "g.abbas275@yahoo.com");
  TextEditingController passwordTextEditingController = TextEditingController(text: "Abbas@123");
  GlobalKey<FormState> FormKey = GlobalKey();

  validate() {
    if (FormKey.currentState!.validate()) {
      _signInNow();
    }
  }

  toggleLoading(bool value) {
    isLoading = value;
    update();
  }

  Future<void> _signInNow() async {
    toggleLoading(true);
    try {
      var detail = await signin_services.post_signin_api(
          email: emailTextEditingController.text,
          password: passwordTextEditingController.text);
      toggleLoading(false);
      if (detail != null) {
        print(detail);
        if (detail is LoginModel) {
         await Get.find<storage_controller>().storeLoginModel(detail);

          show_snackBarSuccess(title: "Logined Successfully", description: detail.msg??"");
          Get.offAll(()=>  root_page());
         // Get.offAll(HomeScreenView());
        } else {
          show_snackBarError(title: "Error!", description: detail["msg"]);
        }
      } else {
        show_snackBarError(
            title: "Error!",
            description: "Please check your internet connection");
      }
    } catch (e) {
      toggleLoading(false);
    }
  }
}
