import 'package:aidber/screens/home_screen/home_screen_view.dart';
import 'package:aidber/services/auth/signin_services.dart';
import 'package:aidber/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class signin_controller extends GetxController {
  bool isLoading = false;
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
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
        if (detail["status"].toString() == "1") {
          show_snackBarSuccess(
              title: "Logined Successfully", description: detail["msg"]);
          Get.offAll(HomeScreenView());
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
