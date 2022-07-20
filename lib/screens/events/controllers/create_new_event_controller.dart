import 'package:aidber/data/services/events/add_event_services.dart';
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

  void pick_image_gallery() async {
    selectedImageFile = await pickerSource.pickImage(source: ImageSource.gallery);
    if (selectedImageFile != null) {
      update();
    }
  }

  submit(){
    if(formKey.currentState?.validate()??false){
      createEventNow();
    }
  }
  createEventNow()async {
    if (selectedImageFile == null) {
      show_snackBarError(title: "Select Image", description: "You must attach a photo");
     var detail = await  EventServices.add_event(
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
     print(detail);
    }
  }
}