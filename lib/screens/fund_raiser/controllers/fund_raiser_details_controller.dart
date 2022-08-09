import 'package:aidber/data/services/fund_raiser/fund_raiser_services.dart';
import 'package:get/get.dart';

import '../../../data/services/fund_raiser/fund_raiser_detail.dart';
import '../../../global_widgets/my_widget_animator.dart';
import '../../../models/fund_raiser/fund_raiser_model.dart';

class FundRaiserDetailController extends GetxController {
  final String id;

  @override
  onInit(){
    super.onInit();
    getData();
  }
  FundRaiserDetailController({required this.id});

  // hold data
  FundRaiserDetailModel data = FundRaiserDetailModel();

  // api call status
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;

  getData() async {
    apiCallStatus = ApiCallStatus.loading;
    try {
      FundRaiserDetailModel? model = await FundRaiserServices.getAFundRaiserDetails(id);
      if (model != null) {
        data = model;
        apiCallStatus = ApiCallStatus.success;
      }else{
        apiCallStatus = ApiCallStatus.empty;
      }
      update();
    } catch (e) {
      apiCallStatus = ApiCallStatus.error;
      update();
    }
  }
}