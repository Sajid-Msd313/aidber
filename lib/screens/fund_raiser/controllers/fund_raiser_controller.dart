import 'package:aidber/data/services/fund_raiser/fund_raiser_services.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/fund_raiser/fund_raiser_model.dart';

class FundRaiserController extends GetxController {
  final ScrollController scrollController = ScrollController();
  @override
  void onInit() {
    super.onInit();
    getAllFundRaisers(isInitial: true);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        controller.callLoad();
        isAtTop = false;
      }
      if(scrollController.position.pixels == 0){
        isAtTop = true;
        update();
      }
    });

    // scrollController.addListener(() {
    //   scrollController.position.pixels == scrollController.position.maxScrollExtent ? onLoading(): null;

    // });
  }

  bool _isLoading = false;
  List<SingleFundModel> fundRaisersList = [];
  bool loadMore = true;
  bool isAtTop = true;
  FundRaiserModel responseModel = FundRaiserModel();

  getAllFundRaisers({bool isInitial = true, bool isReset = false, String? nextPageUrl}) async {
    if (loadMore == false) return;
    if (isInitial) isLoading = true;
    FundRaiserModel? detail = await FundRaiserServices.getAllFundRaiser();
    isLoading = false;
    if (detail != null) {
      responseModel = detail;
      List<SingleFundModel> list = responseModel.data?.data ?? [];
      if (list.isNotEmpty) {
        if (isReset) {
          fundRaisersList = list;
        } else {
          fundRaisersList.addAll(list);
        }
      }
      update();
    }
  }

  insertLocally(SingleFundModel model) {
    fundRaisersList.insert(0, model);
    update();
  }

  //=====================================>> refresh things here
  EasyRefreshController controller = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );

  void onRefresh() async {
    await getAllFundRaisers(isInitial: false, isReset: true);
    controller.finishRefresh();
    update();
  }

  void onLoading() async {

    if (loadMore == false || responseModel.data?.nextPageUrl == null) {
      loadMore =  responseModel.data?.nextPageUrl != null;
      update();
      controller.finishLoad(IndicatorResult.noMore);
      return;
    }
    getAllFundRaisers(isInitial: false, nextPageUrl: responseModel.data?.nextPageUrl);
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }
}

class FundRaiserBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FundRaiserController>(() => FundRaiserController());
  }
}