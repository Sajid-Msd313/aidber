import 'package:get/get.dart';

class FundRaiserController extends GetxController {

}


class FundRaiserBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FundRaiserController>(() => FundRaiserController());
  }
}