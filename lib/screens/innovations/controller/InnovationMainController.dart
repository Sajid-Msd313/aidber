import 'package:aidber/data/services/innovations/innovation_services.dart';
import 'package:aidber/models/innovations/innovation_item_model.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:get/get.dart';

import '../../../models/innovations/innovation_response_model.dart';
import '../../../utils/utils.dart';

class InnovationMainController extends GetxController {
  @override
  onInit() {
    super.onInit();
    fetchInnovations();
  }

  bool _isLoading = false;
  List<InnovationItemModel> innovationList = [];
  bool _loadMore = true;
  InnovationResponseModel responseModel = InnovationResponseModel();

  ///TODO: Look for isReset because no addAll is being implemented here...
  fetchInnovations({bool isInitial = true, bool isReset = false, String? nextPageUrl}) async {
    if (_loadMore == false) return;
    if (isInitial) isLoading = true;
    var detail = await CreateInnovationServices.getInnovations(nextPageUrl);
    isLoading = false;
    if (detail is InnovationResponseModel) {
      responseModel = detail;

      innovationList = responseModel.data?.data ?? [];

      update();
    }
  }

  insertLocally(InnovationItemModel model) {
    innovationList.insert(0, model);
    update();
  }

  ///SHares Innovations..
  void shareInnovation({required String id}) async {
    try{
      print("Sharing Innovation");
      var detail = await CreateInnovationServices.shareInnovation(id: id);
      if (detail != null) {
        if (detail['status'] == true) {
          showSnackBarInformation(description: detail['message']);
        } else {
          show_snackBarError(title: "Couldn't share", description: detail['message']);
        }
      }
    }catch(e){
      print(e);
    }

  }

  //=====================================>> refresh things here
  EasyRefreshController controller = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );

  void onRefresh() async {
    await fetchInnovations(isInitial: false, isReset: true);
    controller.finishRefresh();
    update();
  }

  void onLoading() async {
    if (_loadMore == false || responseModel.data?.nextPageUrl == null) {
      controller.finishLoad(IndicatorResult.noMore);
    }
    fetchInnovations(isInitial: false, nextPageUrl: responseModel.data?.nextPageUrl);
  }

  //================================ Getters setters below
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