import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddFundRaiserController extends GetxController{
  final GlobalKey<FormState> formKey = GlobalKey();
final TextEditingController titleC = TextEditingController();
final TextEditingController descriptionC = TextEditingController();
final TextEditingController requestNameC = TextEditingController();
final TextEditingController amountC = TextEditingController();
final TextEditingController accountC = TextEditingController();
final TextEditingController bankNumberC = TextEditingController();
List<XFile> caseImages = [];
List<XFile> caseVideos = [];




}


class AddFundRaiserBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddFundRaiserController>(() => AddFundRaiserController());
  }
}