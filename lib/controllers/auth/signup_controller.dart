import 'package:aidber/data/services/auth/signup_services.dart';
import 'package:aidber/models/auth/signup_model.dart';
import 'package:aidber/utils/utils.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../data/api.dart';
class signup_controller extends GetxController {
  ApiClient apiClient;
  signup_controller({required this.apiClient});
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
    var detail = await signup_services.post_signup_api(client: apiClient,username: username.text, full_name: full_name.text, email: email.text, password: password.text);
    toggleLoading(false);
    if (detail != null) {
      if (detail is SignupModel) {
        show_snackBarSuccess(title: "Account Created", description: detail.msg ?? "");
      } else if(detail is Response) {
        show_snackBarError(title: "Error!", description: detail.statusText ?? "");
      }
    }
  }
}

class SignUpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<signup_controller>(() => signup_controller(apiClient: Get.find<ApiClient>()));
  }
}