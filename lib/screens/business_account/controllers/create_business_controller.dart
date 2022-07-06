import 'package:aidber/data/services/business/business_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/business/user_business_model.dart';

class create_business_controller extends GetxController {
  bool _isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController businessNameC = TextEditingController();
  TextEditingController businessTaglineC = TextEditingController();
  TextEditingController websiteC = TextEditingController();
  TextEditingController industryC = TextEditingController();
  TextEditingController locationC = TextEditingController();
  TextEditingController companySizeC = TextEditingController();
  TextEditingController phoneNumberC = TextEditingController();
  TextEditingController yearOfFoundationC = TextEditingController();
  TextEditingController aboutC = TextEditingController();

  void validate() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      createAccount();
    }
  }

  createAccount() async {
    isLoading = true;
    Map reqBody = {
      "business_name": businessTaglineC.text,
      "business_tagline": websiteC.text,
      "website": websiteC.text,
      "industry": industryC.text,
      "location": locationC.text,
      "company_size": companySizeC.text,
      "year_of_foundation": yearOfFoundationC.text,
      "about": aboutC.text,
    };
    var detail = await business_services.createAccountBusiness(reqBody: reqBody);
    isLoading = false;
    if (detail is UserBusinessModel) {
      print("UserBusinessModel");
      print(detail.toJson());
    }
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }
}
