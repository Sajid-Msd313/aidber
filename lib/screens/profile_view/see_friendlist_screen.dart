import 'package:aidber/global_widgets/appbar.dart';
import 'package:aidber/global_widgets/circluar_progressIndicator.dart';
import 'package:aidber/global_widgets/my_widget_animator.dart';
import 'package:aidber/models/my_profile/my_profile_model.dart';
import 'package:aidber/screens/profile_view/controllers/see_friendlist_controller.dart';
import 'package:aidber/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeeFriendListScreen extends StatelessWidget {
  const SeeFriendListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Community People"),
      body: GetBuilder<SeeFriendListController>(
          init: SeeFriendListController(),
          builder: (controller) {
            return MyWidgetsAnimator(
                apiCallStatus: controller.apiCallStatus,
                emptyWidget: () => const Center(
                      child: Text("There are no community people in your account"),
                    ),
                loadingWidget: () => const circular_progressIndicator(),
                errorWidget: () => Text(controller.errorMessage ?? "Please try again!"),
                successWidget: () => ListView.builder(
                    itemCount: controller.data.users!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FriendItemTile(user: controller.data.users![index]);
                    }));
          }),
    );
  }
}

class FriendItemTile extends StatelessWidget {
  final User user;

  const FriendItemTile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        leading: ClipRRect(
            child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.network(constans.DEFAULT_IMAGE))),
        title: Text(user.username ?? ""));
  }
}