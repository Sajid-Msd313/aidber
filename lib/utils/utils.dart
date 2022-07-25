import 'package:aidber/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_utils/src/extensions/num_extensions.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/src/places.dart';
import 'package:intl/src/intl/date_format.dart';

String formate_Date1(String datetime) {
  if (datetime.toString() == "" || datetime.toString() == "null") {
    return "";
  }

  DateTime time = DateTime.parse(datetime);
  String formattedDate = DateFormat('yyyy-MM-dd').format(time);

  return formattedDate.toString();
}

String convertToHISFormate(DateTime? date){
  return "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}";
}

Future<PlacesDetailsResponse?> displayPrediction(
  Prediction? p,
) async {
  if (p != null) {
    GoogleMapsPlaces _places = GoogleMapsPlaces(
      apiKey: constans.GOOGLE_API_KEY,
      apiHeaders: await const GoogleApiHeaders().getHeaders(),
    );
    PlacesDetailsResponse detail =
        await _places.getDetailsByPlaceId(p.placeId!);
    return detail;
  }
}

show_snackBarSuccess({required String title, required String description}) {
  Get.snackbar(
    title,
    description,
    colorText: Colors.white,
    borderRadius: 10,
    backgroundColor: Colors.green.shade400,
    icon: const Icon(Icons.check_circle, color: Colors.white),
    animationDuration: 0.45.seconds,
    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
    reverseAnimationCurve: Curves.easeOutExpo,
    overlayColor: Colors.white54,
    overlayBlur: .1,
    margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
    snackStyle: SnackStyle.FLOATING,
    snackPosition: SnackPosition.BOTTOM,
  );
}
void showSnackBarInformation({ required String description}) {
  Get.showSnackbar(GetSnackBar(
    backgroundColor: Colors.green,
    message: description,
    mainButton: TextButton(
      onPressed: () => Get.closeCurrentSnackbar(),
      child: const Text('close',style: TextStyle(color: Colors.white),),
    ),
    onTap: (_) => Get.closeCurrentSnackbar(),
    duration: const Duration(seconds: 2),
    snackStyle: SnackStyle.FLOATING,
    margin: const EdgeInsets.all(20),
    borderRadius: 10,
    forwardAnimationCurve: Curves.decelerate,
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
  ));
}
show_snackBarError({required String title, required String description}) {
  Get.snackbar(
    title,
    description,
    colorText: Colors.white,
    borderRadius: 10,
    backgroundColor: Colors.red.shade800,
    icon: const Icon(Icons.error, color: Colors.white),
    animationDuration: 0.45.seconds,
    forwardAnimationCurve: Curves.decelerate,
    reverseAnimationCurve: Curves.easeOutExpo,
    overlayColor: Colors.white54,
    overlayBlur: .1,
    margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    snackStyle: SnackStyle.FLOATING,
    snackPosition: SnackPosition.BOTTOM,
  );
}

//platformexeption errors
check_errormessage({required String e}) {
  if (e.toString().contains("Failed host lookup")) {
    show_snackBarError(
        title: "Error", description: "Please check your internet connection!");
  } else {
    show_snackBarError(title: "Error", description: e.toString());
  }
}