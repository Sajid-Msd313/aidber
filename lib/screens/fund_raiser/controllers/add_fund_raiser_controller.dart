import 'dart:async';

import 'package:aidber/data/services/fund_raiser/fund_raiser_create_services.dart';
import 'package:aidber/models/fund_raiser/fund_raiser_model.dart';
import 'package:aidber/screens/fund_raiser/controllers/fund_raiser_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/utils.dart';
import '../../create_a_post/controller/create_post_controller.dart';

class AddFundRaiserController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController titleC = TextEditingController();
  final TextEditingController descriptionC = TextEditingController();
  final TextEditingController requestNameC = TextEditingController();
  final TextEditingController amountC = TextEditingController();
  final TextEditingController accountC = TextEditingController();
  final TextEditingController bankNumberC = TextEditingController();
  List<XFile> caseImages = [];
  List<String> caseVideosPath = [];
  List<String> accountList = ["Saving Local", "Current Local"];
  final ImagePicker _picker = ImagePicker();

  Future<void> createFundRaiser() async {
    Get.back();
    if (caseImages.isNotEmpty || caseVideosPath.isNotEmpty) showuploadProgress();
    ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text("You will be notified when your post is live"),
    ));
    var detail = await FundRaiserCreateServices.createFundRaiser(
        callback: _setUploadProgress,
        title: titleC.text,
        fund_raiser_desc: descriptionC.text,
        organisation_name: requestNameC.text,
        amount: amountC.text,
        bank: accountC.text,
        account_number: bankNumberC.text,
        images: caseImages,
        videos: caseVideosPath);
    print(detail);
    if (detail["message"] != null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(detail["message"]),
      ));
      Get.find<FundRaiserController>().insertLocally(SingleFundModel.fromJson(detail["data"]));

      // show_snackBarSuccess(title: "Posted!", description: "Posted Successfully!");
    }
    if (detail["errors"] != null) {
      print("controller");
      Map map = detail["errors"];
      String error_message = "";
      map.forEach((key, value) {
        //print("for each: ${value.toString().replaceAll("[", "")}");
        value = value.toString().replaceAll("[", "");
        value = value.toString().replaceAll("]", "");
        _showErrorMessage(value);
        // value = error_message;
      });
    }
  }

  void pickImages() async {
    caseImages = await _picker.pickMultiImage() ?? [];
    update();
  }
  void pickVideos()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );
    for (var file in result?.files ?? []) {
      caseVideosPath.add(file.path??"");
    }
    update();
  }

  //********************progress downloading works
  double _progressValue = 0;
  int _progressPercentValue = 0;
  Timer? _debounce;

  showuploadProgress() {
    Get.defaultDialog(
        title: "Upload Progress",
        backgroundColor: Colors.white,
        titleStyle: const TextStyle(color: Colors.black),
        content: GetBuilder<AddFundRaiserController>(
            builder: (controlelr) => Text(controlelr._progressPercentValue.toString() +
                " "
                    "%")),
        radius: 30);
  }

  void _setUploadProgress(int sentBytes, int totalBytes) {
    double __progressValue = Util.remap(sentBytes.toDouble(), 0, totalBytes.toDouble(), 0, 1);

    __progressValue = double.parse(__progressValue.toStringAsFixed(2));

    if (__progressValue != _progressValue) _progressValue = __progressValue;
    _progressPercentValue = (_progressValue * 100.0).toInt();
    if (_progressPercentValue == 100) {
      Future.delayed(800.milliseconds).then((value) => {if (Get.isDialogOpen ?? false) Get.back()});
    }
    update();
  }

  _showErrorMessage(String value) {
    if (_debounce != null && _debounce!.isActive) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 800), () {
      show_snackBarError(title: "Error", description: value.toString());
    });
  }
}

class AddFundRaiserBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddFundRaiserController>(() => AddFundRaiserController());
  }
}