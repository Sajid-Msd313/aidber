import 'package:aidber/data/services/events/add_event_services.dart';
import 'package:aidber/models/event/event_model.dart';
import 'package:aidber/screens/events/controllers/event_controller.dart';
import 'package:aidber/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateNewEventController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController whatToExpectC = TextEditingController();
  TextEditingController locationC = TextEditingController();
  TextEditingController dateC = TextEditingController();
  TextEditingController timeC = TextEditingController();
  TextEditingController descriptionC = TextEditingController();
  TextEditingController titleC = TextEditingController();
  TextEditingController organizedByC = TextEditingController();
  XFile? selectedImageFile;

  final ImagePicker pickerSource = ImagePicker();

  bool _isLoading = false;

  void pick_image_gallery() async {
    selectedImageFile = await pickerSource.pickImage(source: ImageSource.gallery);
    if (selectedImageFile != null) {
      update();
    }
  }

  submit() {
    if (formKey.currentState?.validate() ?? false) {
      createEventNow();
    }
  }

  createEventNow() async {
    print("Asdasd");
    if (selectedImageFile == null) {
      show_snackBarError(title: "Select Image", description: "You must attach a photo");
      return;
    }
    isLoading = true;
    var detail = await EventServices.add_event(
        title: titleC.text,
        location: locationC.text,
        organised_by: organizedByC.text,
        what_to_expect: whatToExpectC.text,
        latitude: "",
        longitude: "",
        description: descriptionC.text,
        imagePath: selectedImageFile?.path ?? "",
        date: dateC.text,
        time: timeC.text);
    isLoading = false;
    //TODO:ADD LOCALLY TO LIST AND GET BACK TO THE LIST PAGE
    debugPrint("TODO:ADD LOCALLY TO LIST AND GET BACK TO THE LIST PAGE");
    if (detail is Event) {
      //TALKING ABOUT THIS, NOT QWOKRING PROPLY>
      Get.find<EventController>().addLocally(detail);
      Get.back();
      show_snackBarSuccess(title: "Success", description: "Event created successfully");
    } else if (detail["errors"] != null) {
      print("controller");
      Map map = detail["errors"];
      String error_message = "";
      ;

      map.forEach((key, value) {
        //print("for each: ${value.toString().replaceAll("[", "")}");
        error_message = value.toString().replaceAll("[", "");
        error_message = value.toString().replaceAll("]", "");
        // value = error_message;
      });

      error_message = error_message.replaceAll("[", "");
      error_message = error_message.replaceAll("]", "");
      _isLoading = false;

      print(error_message);
      show_snackBarError(title: "Error", description: error_message ?? "");
    }

    debugPrint(detail);
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }
}