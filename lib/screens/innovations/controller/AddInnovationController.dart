// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:aidber/data/services/innovations/innovation_services.dart';
import 'package:aidber/models/innovations/innovation_item_model.dart';
import 'package:aidber/utils/AppData.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/utils.dart';
import '../../create_a_post/controller/create_post_controller.dart';
import '../../create_a_post/widgets/select_gallery_camera_widget.dart';
import 'InnovationMainController.dart';

class AddInnovationController extends GetxController {
  final TextEditingController titleC = TextEditingController();
  final TextEditingController categoryC = TextEditingController();
  final TextEditingController linkC = TextEditingController();
  final TextEditingController descriptionC = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  onCategorySelected(int index) {
    categoryC.text = category[index];
  }

  XFile? pickedImage;
  File? pickedFile;

  bool _isLoading = false;

  final ImagePicker pickerSource = ImagePicker();

  validateFields() {
    if (formKey.currentState?.validate() ?? false) {
      Get.back();
      submit();
    }
  }

  submit() async {
    isLoading = true;
    Map<String, dynamic> requestBody = {
      "title": titleC.text,
      "category": categoryC.text,
      "link": linkC.text != "" ? linkC.text : null,
      "description": descriptionC.text,
      // "image[]": pickedImage?.path,
      // "file[]": pickedFile?.path
    };
    // showuploadProgress();
    showSnackBarToNotifyUser();
    var detail = await CreateInnovationServices.createInnovationPost(
        callback: _setUploadProgress, reqBody: requestBody, imagesPath: [pickedImage?.path], filepath: pickedFile?.path);
    _checkErrors(detail);
  }

  ///shows error on screen with snackbar if exists
  _checkErrors(detail) {
    if (detail["errors"] != null) {
      print("controller");
      Map map = detail["errors"];
      String errorMessage = "";

      map.forEach((key, value) {
        //print("for each: ${value.toString().replaceAll("[", "")}");
        errorMessage = value.toString().replaceAll("[", "");
        errorMessage = value.toString().replaceAll("]", "");
        // value = error_message;
      });

      errorMessage = errorMessage.replaceAll("[", "");
      errorMessage = errorMessage.replaceAll("]", "");
      _isLoading = false;
      print(errorMessage);
      show_snackBarError(title: "Error", description: errorMessage);
    }

    if (detail["message"] != null) {
      InnovationItemModel model = InnovationItemModel.fromJson(detail["data"]);
      Get.find<InnovationMainController>().insertLocally(model);
      showSnackBarToNotifyUser(message: detail["message"]);
      // show_snackBarSuccess(title: "Posted!", description: "Posted Successfully!");
    }
  }

  showSnackBarToNotifyUser({String? message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(message ?? "You will be notified when your Innovation is uploaded"),
    ));
  }

  void openImagePicker(context) {
    Get.defaultDialog(content: SelectGalleryCameraWidget(controller: this), title: "Select Image");
  }

  Future<void> openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ["pdf", "doc"]);

    if (result != null && result.files.single.path != null) {
      pickedFile = File(result.files.single.path!);
      update();
    }
  }

  removeFileCallBack() {
    pickedFile = null;
    update();
  }

  void pick_image_camera() async {
    final XFile? image = await pickerSource.pickImage(source: ImageSource.camera);
    if (image != null) {
      pickedImage = image;
      update();

      print("captured  ${image.path}");
    }
  }

  void pick_image_gallery() async {
    final XFile? image = await pickerSource.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImage = image;
      update();
    }
  }

  void removeImage() {
    pickedImage = null;
    update();
  }

  //progress downloading works
  double _progressValue = 0;
  int _progressPercentValue = 0;

  ///shows progress builder dialog if image or file is selected
  showuploadProgress() {
    if (pickedFile != null || pickedImage != null) {
      Get.defaultDialog(
          title: "Upload Progress",
          backgroundColor: Colors.white,
          titleStyle: const TextStyle(color: Colors.black),
          content:
              GetBuilder<AddInnovationController>(builder: (ctrl) => Text(ctrl._progressPercentValue.toString() + "%")),
          radius: 30);
    }
  }

  ///used for upload progress request
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

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }
}

class AddInnovationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddInnovationController());
  }
}