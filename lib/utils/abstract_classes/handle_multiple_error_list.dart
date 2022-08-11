import 'dart:async';

import '../utils.dart';

abstract class HandleMultipleErrorList {
  Timer? _debounce;

  ///Accepts [response.data] and checks if it has errors and show accordingly
  DisplayError(dynamic detail){
    if (detail["errors"] != null) {
      Map map = detail["errors"];
      map.forEach((key, value) {
        //print("for each: ${value.toString().replaceAll("[", "")}");
        value = value.toString().replaceAll("[", "");
        value = value.toString().replaceAll("]", "");
        _showErrorMessage(value);
        // value = error_message;
      });
    }
  }
  _showErrorMessage(String value) {
    if (_debounce != null && _debounce!.isActive) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 800), () {
      show_snackBarError(title: "Error", description: value.toString());
    });
  }
}