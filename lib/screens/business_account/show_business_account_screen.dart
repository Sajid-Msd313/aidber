import 'package:aidber/global_widgets/cache_network_image.dart';
import 'package:aidber/global_widgets/custom_dropDown.dart';
import 'package:aidber/models/business/user_business_model.dart';
import 'package:aidber/screens/business_account/controllers/business_mainController.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/appbar.dart';
import '../create_a_post/create_post_screen.dart';
import 'controllers/create_business_controller.dart';
import 'create_business_account_screen.dart';

class show_business_accountScreen extends GetView<BusinessMainController> {
  const show_business_accountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Business Account",
        actions: [
          IconButton(
            tooltip: "Create Business Account",
            onPressed: () => {
              Get.to(
                () => const CreateBusinessAccountScreen(),
                binding: BindingsBuilder(() => {Get.put(CreateBusinessController())}),
              ),
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: GetBuilder<BusinessMainController>(
          init: Get.find<BusinessMainController>(),
          builder: (controller) {
            if (controller.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (controller.userBusinessAccounts.isEmpty) {
              return const Center(
                child: Text("No Business Account Found"),
              );
            }
            return EasyRefresh(
              simultaneously: true,
              controller: controller.controller,
              onRefresh: controller.onRefresh,
              header: const ClassicHeader(processedDuration: Duration(milliseconds: 100)),
              footer: const ClassicFooter(
                noMoreText: "No more stories",
              ),
              child: ListView.builder(
                  itemCount: controller.userBusinessAccounts.length,
                  itemBuilder: (_, index) => BusinessAccountItem(
                        account: controller.userBusinessAccounts[index],
                      )),
            );
          }),
    );
  }
}

class BusinessAccountItem extends StatelessWidget {
  final BusinessItem account;

  const BusinessAccountItem({Key? key, required this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => {debugPrint(account.toJson().toString())},
      leading: ClipRRect(
          child: Container(
              height: 50,
              width: 50,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: CacheNetworkImageWidget(
                url: account.profilePicture,
              ))),
      title: Text(account.businessName ?? "Business Name", style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text("${account.followersCount ?? 0} Community | ${account.industry}", style: const TextStyle(fontSize: 12)),
      trailing: CustomDropDownPopup(
        dropDownList: const ["Create A Post", "Edit Business Account", "Delete Business Account"],
        onSelected: onSelectedTab,
      ),
    );
  }

  ///Calls when user selects any option from dropdown
  void onSelectedTab(int index) {
    switch (index) {
      case 0:
        {
          ///CREATE A POST
          Get.to(() => create_post_screen(businessName: account.businessName, businessId: account.id?.toString()),
              transition: Transition.cupertinoDialog, curve: Curves.bounceIn, duration: 400.milliseconds);
          break;
        }
      case 1:
        {
          print("case 1");
          Get.to(
              () => const CreateBusinessAccountScreen(
                    isEditMode: true,
                  ),
              transition: Transition.cupertinoDialog,
              curve: Curves.bounceIn,
              duration: 400.milliseconds,
              binding: BindingsBuilder(() => {
                    Get.put(CreateBusinessController(business: account)),
                  }));

          break;
        }
      case 2:
        {
          Get.find<BusinessMainController>().askConfirmFromUsertoDelete(id: account.id.toString(), context: Get.context!);
          break;
        }
    }
  }
}