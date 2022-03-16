
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_utils/src/extensions/num_extensions.dart';


   show_snackBarSuccess({required String title, required String description}) {
    Get.snackbar(
      title,
      description,
      colorText: Colors.white,
      borderRadius: 0,
      backgroundColor: Colors.green.shade400,
      icon: Icon(Icons.check_circle, color: Colors.white),
      animationDuration: 0.45.seconds,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      reverseAnimationCurve: Curves.easeOutExpo,
      overlayColor: Colors.white54,
      overlayBlur: .1,
      margin: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  show_snackBarError({required String title, required String description}) {
    Get.snackbar(
      title,
      description,
      colorText: Colors.white,
      borderRadius: 0,
      backgroundColor: Colors.red.shade800,
      icon: Icon(Icons.error, color: Colors.white),
      animationDuration: 0.45.seconds,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      reverseAnimationCurve: Curves.easeOutExpo,
      overlayColor: Colors.white54,
      overlayBlur: .1,
      margin: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
    );
  }



//platformexeption errors
   check_errormessage({required String e}){
    if(e.toString().contains("Failed host lookup")){
      show_snackBarError(title: "Error", description: "Please check your internet connection!");
    }else {
      show_snackBarError(title: "Error", description: e.toString());
    }
  }
