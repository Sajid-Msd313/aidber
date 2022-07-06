import 'package:aidber/models/business/user_business_model.dart';
import 'package:aidber/screens/business_account/controllers/business_mainController.dart';
import 'package:aidber/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/appbar.dart';
import '../create_a_post/create_post_screen.dart';
import 'controllers/create_business_controller.dart';
import 'create_business_account_screen.dart';

class show_business_accountScreen extends GetView<business_mainController> {
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
                () => const create_business_accountview(),
                binding: BindingsBuilder(
                    () => {Get.put(create_business_controller())}),
              ),
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: GetBuilder<business_mainController>(
          init: Get.find<business_mainController>(),
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
            return ListView.builder(
                itemCount: controller.userBusinessAccounts.length,
                itemBuilder: (_, index) => businessAccountItem(
                      account: controller.userBusinessAccounts[index],
                    ));
          }),
    );
  }
}

class businessAccountItem extends StatelessWidget {
  final BusinessItem account;

  const businessAccountItem({Key? key, required this.account})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => {},
      leading: ClipRRect(
          child: Container(
        height: 50,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.network(constans.DEFAULT_IMAGE),
      )),
      title: Text(
        account.businessName ?? "Business Name",
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        "76 Communitys | ${account.companySize}",
        style: TextStyle(fontSize: 12),
      ),
      trailing: IconButton(
          tooltip: "More",
          padding: EdgeInsets.zero,
          icon: const Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          onPressed: () {

            Get.to(()=> create_post_screen(businessName: account.businessName,businessId: account.id?.toString(),), transition: Transition.cupertinoDialog,duration: 200.milliseconds);

          }),
    );
  }
}
