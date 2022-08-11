import 'package:aidber/data/services/my_profile/my_profile.dart';
import 'package:aidber/models/my_profile/friend_list_model.dart';
import 'package:get/get.dart';

import '../../../global_widgets/my_widget_animator.dart';

class SeeFriendListController extends GetxController {
  @override
  onInit() {
    super.onInit();
    getData();
  }

  // hold data
  FriendListModel data = FriendListModel();

  String? errorMessage;

  // api call status
  ApiCallStatus _apiCallStatus = ApiCallStatus.holding;

  getData() async {
    errorMessage = null;
    apiCallStatus = ApiCallStatus.loading;
    try {
      var detail = await myProfile_services.getFriendList();
      if (detail != null) {
        if (detail is FriendListModel) {
          data = detail;
          apiCallStatus = ApiCallStatus.success;
        } else {
          errorMessage = detail["message"] ?? "Something Went Wrong!";
          apiCallStatus = ApiCallStatus.error;
        }
      } else {
        apiCallStatus = ApiCallStatus.empty;
      }
    } catch (e) {
      print(e);
      apiCallStatus = ApiCallStatus.empty;
    }
  }

  ApiCallStatus get apiCallStatus => _apiCallStatus;

  set apiCallStatus(ApiCallStatus value) {
    _apiCallStatus = value;
    update();
  }
}