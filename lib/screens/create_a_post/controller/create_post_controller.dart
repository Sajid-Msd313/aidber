import 'dart:async';

import 'package:aidber/services/posts/create_post_services.dart';
import 'package:aidber/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:get/get.dart';
import 'package:google_maps_webservice/src/core.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/utils.dart';
import '../../../utils/uuid_generator.dart';
import '../widgets/select_gallery_camera_widget.dart';

class create_post_controller extends GetxController {
  bool _isLoading = false;
  String _post_categoryField = "";
  Timer? _debounce;

  final ImagePicker pickerSource = ImagePicker();
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController captionField = TextEditingController();

//  TextEditingController post_categoryField = TextEditingController();
  TextEditingController image_fileField = TextEditingController();
  String latitude = "";
  String longitude = "";

  void validate() {
    if (image_fileField.text.isEmpty) {
      show_snackBarError(
          title: 'Image Empty', description: "Please select Image first");
      return;
    }
    if (_post_categoryField.isEmpty) {
      show_snackBarError(
          title: 'Select Category', description: "Please select category first");
      return;
    }
    if (formKey.currentState!.validate()) {
      create_PostNow();
    }
  }

  void open_search_map(context) {
    PlacesAutocomplete.show(
      context: context,
      onError: (_) {
        show_snackBarError(
            title: "Error", description: _.errorMessage.toString());
      },
      strictbounds: false,
      sessionToken: Uuid().generateV4(),
      apiKey: constans.GOOGLE_API_KEY,
      mode: Mode.overlay,
      // Mode.fullscreen
      types: ["address"],
      components: [Component(Component.country, "PK")],
      language: "en",
    ).then((value) {
      displayPrediction(value).then((value) => _fill_google_search_vals(value));
    });
  }

  void open_imageImagePicker(context) {
    Get.defaultDialog(

        content:  select_gallery_camera_widget(), title: "Select Image");
  }

  void pick_image_camera() async {
    final XFile? image =
        await pickerSource.pickImage(source: ImageSource.gallery);
    if (image != null) {
      image_fileField.text = image.path;
    }
  }

  void pick_image_gallery() async {
    final XFile? image =
        await pickerSource.pickImage(source: ImageSource.camera);
    if (image != null) {
      image_fileField.text = image.path;
    }
  }

  void create_PostNow()async {
    isLoading = true;
    Get.back();
   ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text("You will be notified when your post is live"),));
    var detail =await  create_post_services.create_post(
        caption: captionField.text,
        latitude: latitude,
        longitude: longitude,
        image_file: image_fileField.text,
        post_category: post_categoryField);
    if(detail["message"] != null){
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text(detail["message"]),));
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
        _Show_errorMessage(value);
        // value = error_message;
      });
    }
  }




  _Show_errorMessage(String value) {
    if (_debounce != null && _debounce!.isActive) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 800), () {
      show_snackBarError(title: "Error", description: value.toString());
    });
  }
  //GETTTER SETTER BELOW ===================================>

  _fill_google_search_vals(value) async {
    if (value == null) return;
    print(value.result.geometry!.location);
    //addressTextController.text = value.result.formattedAddress.toString();
    latitude = value.result.geometry!.location.lat.toString();
    longitude = value.result.geometry!.location.lng.toString();
    update();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  String get post_categoryField => _post_categoryField;

  set post_categoryField(String value) {
    _post_categoryField = value;
    update();
  }
}
