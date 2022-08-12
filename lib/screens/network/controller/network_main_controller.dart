import 'package:aidber/data/services/network/network_services.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../global_widgets/my_widget_animator.dart';
import '../../../models/network/follower_requests_model.dart';
import '../../../utils/utils.dart';

class NetworkMainController extends GetxController with CommonNetworkMethods {
  @override
  onInit() {
    super.onInit();
    getData();
  }

  // hold data
  FollowerRequestModel data = FollowerRequestModel();

  String? errorMessage;

  // api call status
  ApiCallStatus _apiCallStatus = ApiCallStatus.holding;

  getData({bool isInitial = true}) async {
    errorMessage = null;
    if (isInitial) apiCallStatus = ApiCallStatus.loading;
    try {
      FollowerRequestModel? detail = await NetworkServices.getAllFollowerRequest(null);
      if (detail != null) {
        detail.userFollowerRequests?.data?.removeWhere((element) => element.user == null);
        data = detail;
        if (isInitial) apiCallStatus = ApiCallStatus.success;
      } else {
        if (isInitial) apiCallStatus = ApiCallStatus.empty;
      }
    } catch (e) {
      debugPrint(e.toString());
      if (isInitial) apiCallStatus = ApiCallStatus.empty;
    }
  }

  updateLocally(Request request) {
    int index = data.userFollowerRequests?.data?.indexOf(request) ?? -1;
    if (index != -1) {
      data.userFollowerRequests?.data?.insert(index, request);
      update();
    }
  }
  // EasyRefreshBelow

  EasyRefreshController controller = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );

  void onRefresh() async {
    await getData(isInitial: false);
    controller.finishRefresh();
    update();
  }

  //Setters getters  bnelow =>
  ApiCallStatus get apiCallStatus => _apiCallStatus;

  set apiCallStatus(ApiCallStatus value) {
    _apiCallStatus = value;
    update();
  }
}

class BusinessRequestsNetworkController extends GetxController with CommonNetworkMethods {
  @override
  onInit() {
    super.onInit();
    getData();
  }

  // hold data
  FollowerRequestModel data = FollowerRequestModel();

  String? errorMessage;

  // api call status
  ApiCallStatus _apiCallStatus = ApiCallStatus.holding;

  updateLocally(Request request) {
    int index = data.userBusinessFollowersRequests?.data?.indexOf(request) ?? -1;
    if (index != -1) {
      data.userBusinessFollowersRequests?.data?.insert(index, request);
      update();
    }
  }

  getData({bool isInitial = true}) async {
    errorMessage = null;
    if (isInitial) apiCallStatus = ApiCallStatus.loading;
    try {
      FollowerRequestModel? detail = await NetworkServices.getAllFollowerRequest(null);
      if (detail != null) {
        detail.userBusinessFollowersRequests?.data?.removeWhere((element) => element.user == null);
        data = detail;
        if (isInitial) apiCallStatus = ApiCallStatus.success;
      } else {
        if (isInitial) apiCallStatus = ApiCallStatus.empty;
      }
    } catch (e) {
      debugPrint(e.toString());
      if (isInitial) apiCallStatus = ApiCallStatus.empty;
    }
  }

  // EasyRefreshBelow

  EasyRefreshController controller = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );

  void onRefresh() async {
    await getData(isInitial: false);
    controller.finishRefresh();
    update();
  }

  //Setters getters  bnelow =>
  ApiCallStatus get apiCallStatus => _apiCallStatus;

  set apiCallStatus(ApiCallStatus value) {
    _apiCallStatus = value;
    update();
  }
}

///Share common functions between the controllers
abstract class CommonNetworkMethods {
  Future<void> acceptFriendRequest(String followId, controller) async {
    var detail = await NetworkServices.acceptFriendRequest(follow_id: followId);
    if (detail != null) {
      try {
        controller.updateLocally(Request.fromJson(detail));

      } catch (e) {
        if (detail['status'] == true) {
          showSnackBarInformation(description: detail['message']);
        } else {
          show_snackBarError(title: "Error", description: detail['message']);
        }
        debugPrint(e.toString());
      }
    }
  }
}