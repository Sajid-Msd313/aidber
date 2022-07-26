import 'dart:async';

import 'package:aidber/data/services/posts/create_post_services.dart';
import 'package:aidber/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:get/get.dart';
import 'package:google_maps_webservice/src/core.dart';
import 'package:google_maps_webservice/src/places.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../../../data/api.dart';
import '../../../utils/utils.dart';
import '../../../utils/uuid_generator.dart';
import '../widgets/select_gallery_camera_widget.dart';
import '../widgets/tag_people_search.dart';

class create_post_controller extends GetxController {
  ApiClient apiClient;

  create_post_controller({required this.apiClient});

  bool _isLoading = false;
  String _post_categoryField = "";
  Timer? _debounce;
  TextEditingController linkController = TextEditingController();
  GlobalKey<FormState> formKeyLink = GlobalKey();
  final ImagePicker pickerSource = ImagePicker();
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController captionField = TextEditingController();

  bool _isImageSelected = false;
  RxList<String> _pickedImagesPath = RxList<String>([]);
  String latitude = "";
  String _link = "";

  String get link => _link;

  set link(String value) {
    _link = value;
    update();
  }

  String longitude = "";
  String _address = "";


  List<String> get pickedImagesPath => _pickedImagesPath.value;

  void validate({String? businessId}) {

    if (_post_categoryField.isEmpty) {
      show_snackBarError(
          title: 'Select Category',
          description: "Please select category first");
      return;
    }
    if (formKey.currentState!.validate()) {
      create_PostNow( businessId: businessId);
    }
  }

  //MAIN FUNCTION IS THIS>...
  void create_PostNow({String? businessId}) async {
    isLoading = true;
    Get.back();
    if (_pickedImagesPath.isNotEmpty) showuploadProgress();
    ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text("You will be notified when your post is live"),
    ));
    var detail = await create_post_services.create_post(
        businessId: businessId,
        callback: _setUploadProgress,
        caption: captionField.text,
        latitude: latitude,
        longitude: longitude,
        image_file: _pickedImagesPath,
        taggedUsers: selectedPeople,
        post_category: post_categoryField);
    print(detail);
    if (detail["message"] != null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(detail["message"]),
      ));
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


  //Tag People work
  List<UserModel?> selectedPeople = [];
  List<String> selectedPeopleNames = [];
  List<MultiSelectItem<UserModel?>> dummyUsertagPeople = [
    MultiSelectItem(
        UserModel(id: "1", createdAt: DateTime.now(), name: "bahadur"),
        "Bahaudr"),
    MultiSelectItem(
        UserModel(id: "2", createdAt: DateTime.now(), name: "Rndom"), "Rndom"),
    MultiSelectItem(
        UserModel(id: "5", createdAt: DateTime.now(), name: "Somone"),
        "Somone"),
  ];

  void showtagPeopleDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (ctx) {
        return MultiSelectDialog<UserModel?>(
          items: dummyUsertagPeople,
          searchable: true,
          searchHint: "Search user",
          cancelText: const Text("Clear"),
          unselectedColor: Colors.white,
          title: const Text("Select People to tag"),
          itemsTextStyle: const TextStyle(color: Colors.black),
          selectedItemsTextStyle: const TextStyle(color: Colors.white),
          selectedColor: Theme.of(context).primaryColor,
          listType: MultiSelectListType.CHIP,
          initialValue: selectedPeople,
          onConfirm: (users) {
            selectedPeople.clear();
            selectedPeopleNames.clear();
            selectedPeople.addAll(users);
            for (UserModel? element in users) {
              selectedPeopleNames.add(element!.name.toString());
            }
            update();
          },
        );
      },
    );
  }
//Tag People work ends here...
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



  //progress downloading works
  double _progressValue = 0;
  int _progressPercentValue = 0;
  showuploadProgress() {
    Get.defaultDialog(
        title: "Upload Progress",
        backgroundColor: Colors.white,
        titleStyle: const TextStyle(color: Colors.black),
        content: GetBuilder<create_post_controller>(
            builder: (controlelr) =>
                Text(controlelr._progressPercentValue.toString() + "%")),
        radius: 30);
  }
  void _setUploadProgress(int sentBytes, int totalBytes) {
    double __progressValue =
    Util.remap(sentBytes.toDouble(), 0, totalBytes.toDouble(), 0, 1);

    __progressValue = double.parse(__progressValue.toStringAsFixed(2));

    if (__progressValue != _progressValue) _progressValue = __progressValue;
    _progressPercentValue = (_progressValue * 100.0).toInt();
    if (_progressPercentValue == 100) {
      Future.delayed(800.milliseconds)
          .then((value) => {if (Get.isDialogOpen ?? false) Get.back()});
    }
    update();
  }




  Future<void> displayLinkinputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Attach a link with your post'),
            content: Form(
              key: formKeyLink,
              child: TextFormField(
                controller: linkController,
                decoration: const InputDecoration(hintText: "Paste your link here"),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                color:  Theme.of(context).primaryColor,
                child: const Text('OK',style: TextStyle(color: Colors.white),),
                onPressed: () {
                  print("link: ${linkController.text}");
                  link = linkController.text;
                  Get.back();
                },
              ),
            ],
          );
        });
  }

  void pick_image_gallery() async {
    final List<XFile>? image = await pickerSource.pickMultiImage();
    if (image != null) {
      for (XFile element in image) {
        pickedImagesPath.add(element.path);
      }
      update();
      print(image.length);
    }
  }
  void open_imageImagePicker(context) {
    Get.defaultDialog(
        content: const select_gallery_camera_widget(), title: "Select Image");
  }
  void pick_image_camera() async {
    final XFile? image =
    await pickerSource.pickImage(source: ImageSource.gallery);
    if (image != null) {
      if (!pickedImagesPath.contains(image.path)) {
        pickedImagesPath.add(image.path);
      }
      // image_fileField.text = image.path;
      //  isImageSelected = true;
      print("captured  ${image.path}");
    }
  }



  _Show_errorMessage(String value) {
    if (_debounce != null && _debounce!.isActive) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 800), () {
      show_snackBarError(title: "Error", description: value.toString());
    });
  }


  void clearImage({required String path}) {
    _pickedImagesPath.value.removeWhere((element) => element == path);
    update();
  }
  void clearLink() {
    link = "";
  }
  clearAddress() {
    longitude = "";
    longitude = "";
    address = "";
  }

  //GETTTER SETTER BELOW ===================================>

  _fill_google_search_vals(PlacesDetailsResponse? value) async {
    if (value == null) return;
    print(value.result.geometry!.location);
    print("AAAAAAAAAAAAAAAAAAAAAAAAAAA ${value.result.name}");
    //addressTextController.text = value.result.formattedAddress.toString();

    latitude = value.result.geometry!.location.lat.toString();
    longitude = value.result.geometry!.location.lng.toString();
    address = value.result.name;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
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

  bool get isImageSelected => _isImageSelected;

  set isImageSelected(bool value) {
    _isImageSelected = value;
    update();
  }
}

class Util {
  static double remap(
      double value,
      double originalMinValue,
      double originalMaxValue,
      double translatedMinValue,
      double translatedMaxValue) {
    if (originalMaxValue - originalMinValue == 0) return 0;

    return (value - originalMinValue) /
            (originalMaxValue - originalMinValue) *
            (translatedMaxValue - translatedMinValue) +
        translatedMinValue;
  }
}