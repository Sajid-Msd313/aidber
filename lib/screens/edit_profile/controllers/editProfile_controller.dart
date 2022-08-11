import 'package:aidber/data/services/my_profile/my_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/my_profile/my_profile_model.dart';
import '../../profile_view/controllers/profile_controller.dart';

class editProfile_controller extends GetxController {
  final formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  onInit(){
    User? userData =   Get.find<profile_controller>().myProfileModel.data;
    fullnameC.text = userData?.fullName??"";
    emailC.text = userData?.email??"";
    phoneC.text = userData?.phone??"";
    locationC.text = userData?.address??"";
    occupationC.text = userData?.occupation??"";
    workC.text = userData?.work??"";
    aboutC.text = userData?.about??"";

    super.onInit();
  }
  TextEditingController fullnameC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController locationC = TextEditingController();
  TextEditingController occupationC = TextEditingController();
  TextEditingController workC = TextEditingController();
  TextEditingController aboutC = TextEditingController();

  validateFields() {
    if (formKey.currentState!.validate()) {
      postFormData();
    }
  }

  postFormData() async {
    isLoading = true;
    Map editProfileBody = {
      "full_name": fullnameC.text,
      "email": emailC.text,
      "address": locationC.text,
      "occupation": occupationC.text,
      "work": workC.text,
      "about": aboutC.text,
      "phone": phoneC.text,
    };
    var detail = await myProfile_services.editMyProfile(reqBody: editProfileBody);
    if (detail is MyProfileModel) {
      print("success");
Get.find<profile_controller>().updateLocallyData(detail.data);
      Get.back();
    }
    isLoading = false;
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }
}