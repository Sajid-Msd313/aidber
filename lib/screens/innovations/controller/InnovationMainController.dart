import 'package:aidber/data/services/innovations/innovation_services.dart';
import 'package:aidber/models/innovations/innovation_item_model.dart';
import 'package:get/get.dart';

import '../../../models/innovations/innovation_response_model.dart';

class InnovationMainController extends GetxController {
  @override
  onInit() {
    super.onInit();
    fetchInnovations();
  }

  bool _isLoading = false;
  List<InnovationItemModel> innovationList = [];

  int currentPage = 0;
  String? nextPageUrl;

  fetchInnovations({String? nextPageUrl}) async {
    if (nextPageUrl == null) isLoading = true;
    var detail = await CreateInnovationServices.getInnovations(nextPageUrl);
    isLoading = false;
    if (detail is InnovationResponseModel) {
      print(detail.data!.data!.length.toString());
      currentPage = detail.data?.currentPage ?? 0;
      nextPageUrl = detail.data?.nextPageUrl;
      innovationList = detail.data?.data ?? [];
      print("assignmed");
      update();
    }
  }
  insertLocally(InnovationItemModel model){
    innovationList.insert(0, model);
    update();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }
}


class InnovationMainBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(() => InnovationMainController());
  }

}