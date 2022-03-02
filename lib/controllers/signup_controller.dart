import 'package:aidber/models/signup_model.dart';
import 'package:aidber/services/signup_services.dart';
import 'package:aidber/utils.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
class signup_controller extends GetxController {
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController username =TextEditingController();
  TextEditingController full_name =TextEditingController();
  TextEditingController email =TextEditingController();
  TextEditingController password =TextEditingController();

  toggleLoading(bool value) {
    isLoading = value;
    update();
  }

  void validate(){
    if(formKey.currentState!.validate()){
      print("validated successfully");
      signup_now();
    }
  }
  Future<void> signup_now() async {
    toggleLoading(true);
    var detail = await signup_services.post_signup_api(username: username.text, full_name: full_name.text, email: email.text, password: password.text);
    toggleLoading(false);
    if (detail != null) {
      if (detail is SignupModel) {
        show_snackBarSuccess(
            title: "Account Created", description: detail.msg ?? "");
      } else {
        show_snackBarError(title: "Error!", description: detail["msg"] ?? "");
      }
    }
  }
}
