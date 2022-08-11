import 'package:aidber/data/services/business/business_services.dart';
import 'package:aidber/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/business/user_business_model.dart';
import '../../../utils/abstract_classes/handle_multiple_error_list.dart';

///Use for Update or Create Account bsuiness
class CreateBusinessController extends GetxController with HandleMultipleErrorList {
  ///use for update only. if(passed)
  final BusinessItem? business;

  CreateBusinessController({this.business});

  @override
  onInit() {
    super.onInit();
    if (business != null) {
      businessNameC.text = business?.businessName ?? "";
      businessTaglineC.text = business?.businessTagline ?? "";
      websiteC.text = business?.website ?? "";
      industryC.text = business?.industry ?? "";
      locationC.text = business?.location ?? "";
      companySizeC.text = business?.companySize ?? "";
      // phoneNumberC.text = business?. ?? "";
      yearOfFoundationC.text = business?.yearOfFoundation ?? "";
      aboutC.text = business?.about ?? "";
      update();
    }
  }

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

  ///For Creating Account or Update Account
  void validate({bool isEdit = false}) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      isEdit ? updateAccount() : createAccount();
    }
  }

  void createAccount() async {
    isLoading = true;
    Map reqBody = {
      "business_name": businessNameC.text,
      "business_tagline": businessTaglineC.text,
      "website": websiteC.text,
      "industry": industryC.text,
      "location": locationC.text,
      "company_size": companySizeC.text,
      "year_of_foundation": yearOfFoundationC.text,
      "about": aboutC.text,
    };
    var detail = await business_services.createAccountBusiness(reqBody: reqBody);
    isLoading = false;
    // if (detail is UserBusinessModel) {
    //   print("UserBusinessModel");
    //   print(detail.toJson());
    //   detail.data.data.
    // }
    if (detail is BusinessItem) {
      print("*/* BusinessItem ${detail.toJson()}");
      return;
      // Get.find<BusinessMainController>().updateLocally(detail);
    }
    DisplayError(detail);
  }

  void updateAccount() async {
    isLoading = true;
    Map reqBody = {
      "business_name": businessNameC.text,
      "business_tagline": businessTaglineC.text,
      "website": websiteC.text,
      "industry": industryC.text,
      "location": locationC.text,
      "company_size": companySizeC.text,
      "year_of_foundation": yearOfFoundationC.text,
      "about": aboutC.text,
    };
    var detail = await business_services.updateAccountBusiness(reqBody: reqBody, id: business?.id.toString() ?? "");
    isLoading = false;
    if (detail != null) {
      if(detail["status"] == true){
        Get.back();
        showSnackBarInformation(description: "${businessTaglineC.text} has been updated succesfully, Refresh to see changes");
      }else{
        show_snackBarError(title: "Error occured!", description: detail["message"]);
      }


    }
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }
}