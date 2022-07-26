import 'package:aidber/data/services/events/add_event_services.dart';
import 'package:aidber/models/event/event_model.dart';
import 'package:aidber/screens/events/controllers/event_controller.dart';
import 'package:aidber/utils/constants.dart';
import 'package:aidber/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_maps_webservice/src/core.dart';
import 'package:google_maps_webservice/src/places.dart';

import '../../../utils/uuid_generator.dart';

class CreateNewEventController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController whatToExpectC = TextEditingController();
  TextEditingController locationC = TextEditingController();
  TextEditingController latC = TextEditingController();
  TextEditingController lngC = TextEditingController();
  TextEditingController dateC = TextEditingController();
  TextEditingController timeC = TextEditingController();
  TextEditingController viewtimeC = TextEditingController();
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
        latitude: latC.text,
        longitude:lngC.text,
        description: descriptionC.text,
        imagePath: selectedImageFile?.path ?? "",
        date: dateC.text,
        time: timeC.text);
    isLoading = false;

    if (detail is Event) {
      Get.find<EventController>().addLocally(detail);
      Get.back();
      show_snackBarSuccess(title: "Success", description: "Event created successfully");
    } else if (detail["errors"] != null) {
      print("controller");
      Map map = detail["errors"];
      String error_message = "";

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
      show_snackBarError(title: "Error", description: error_message);
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

  _fill_google_search_vals(PlacesDetailsResponse? value) async {
    if (value == null) return;
    print(value.result.geometry!.location);
    print("AAAAAAAAAAAAAAAAAAAAAAAAAAA ${value.result.name}");
    //addressTextController.text = value.result.formattedAddress.toString();

    latC.text = value.result.geometry!.location.lat.toString();
    lngC.text = value.result.geometry!.location.lng.toString();
    locationC.text = value.result.name;
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }
}