import 'package:aidber/data/services/business/business_services.dart';
import 'package:aidber/models/business/user_business_model.dart';
import 'package:aidber/utils/utils.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BusinessMainController extends GetxController {
  @override
  onInit() {
    fetchUserBusinessAccounts();
    super.onInit();
  }

  List<BusinessItem> userBusinessAccounts = [];
  bool _isLoading = false;

  //fetch business accounts
  fetchUserBusinessAccounts({bool isInitial = true}) async {
    if (isInitial) isLoading = true;
    var detail = await business_services.fetchUserBusinessAccounts();
    if (isInitial) isLoading = false;
    if (detail is UserBusinessModel) {
      userBusinessAccounts = detail.data?.data ?? [];
    }
  }

  askConfirmFromUsertoDelete({required String id, required BuildContext context}) {
    showConfirmAlertDialog(
        context: context,
        title: "Delete Account",
        message: "Are you sure want to delete this account? This "
            "action will not be reverted",
        onPressed: () async {
          Navigator.pop(context);
        await deleteBusinessAccount(id: id);

        },
        onCancel: () => Navigator.pop(context));
  }

  Future<void>deleteBusinessAccount({required String id}) async {
    var detail = await business_services.deleteUserBusinessAccount(id: id);
    if (detail != null) {
      if (detail["status"] == true) {
        showSnackBarInformation(description: "Business Account Deleted Successfully");
      } else {
        show_snackBarError(title: "Error", description: detail["message"]);
      }
      controller.callRefresh(duration: const Duration(milliseconds: 10));
      controller.closeHeaderSecondary();
    }
  }

  ///updates locally of the business account
  updateLocally(BusinessItem account, {bool isAdd = false}) {
    if (isAdd) {
      userBusinessAccounts.insert(0, account);
    } else {
      userBusinessAccounts.removeWhere((element) => element.id == account.id);
      userBusinessAccounts.add(account);
    }

    update();
  }

  EasyRefreshController controller = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );

  void onRefresh() async {
    await fetchUserBusinessAccounts(isInitial: false);
    controller.finishRefresh();
    update();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }
}