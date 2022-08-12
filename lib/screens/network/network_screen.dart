import 'package:aidber/models/network/follower_requests_model.dart';
import 'package:aidber/screens/network/widget/make_single_network_card.dart';
import 'package:aidber/utils/styles.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/circluar_progressIndicator.dart';
import '../../global_widgets/my_widget_animator.dart';
import 'controller/network_main_controller.dart';
import 'widget/make_network_search_field.dart';

class Network_Screen extends StatelessWidget {
  const Network_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List data = [];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF282d6b),
          title: const Text(
            'Found Heal',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          // physics: const BouncingScrollPhysics(),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Network', style: kstyle1.copyWith(fontSize: 20, fontWeight: FontWeight.w800))),
            ),
            const SizedBox(height: 15),
            const make_network_search_field(),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15) + const EdgeInsets.only(bottom: 15),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Follower Requests',
                    style: kstyle1.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                  )),
            ),
            Container(
              height: Get.height * .3,
              margin: const EdgeInsets.all(10),
              child: GetBuilder<NetworkMainController>(
                  init: NetworkMainController(),
                  builder: (controller) {
                    return MyWidgetsAnimator(
                        apiCallStatus: controller.apiCallStatus,
                        emptyWidget: () => emptyWidget(onRefresh: controller.getData),
                        loadingWidget: () => const circular_progressIndicator(),
                        errorWidget: () => Text(controller.errorMessage ?? "Please try again!"),
                        successWidget: () => EasyRefresh(
                              simultaneously: true,
                              controller: controller.controller,
                              onRefresh: controller.onRefresh,
                              header: const ClassicHeader(processedDuration: Duration(milliseconds: 100)),
                              footer: const ClassicFooter(noMoreText: "No more stories"),
                              child: controller.data.userFollowerRequests!.data?.isEmpty ?? true
                                  ? emptyWidget(onRefresh: controller.getData)
                                  : ListView.builder(
                                      itemCount: controller.data.userFollowerRequests!.data!.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final Request request = controller.data.userFollowerRequests!.data![index];
                                        return SingleNetworkCardTile(
                                            onTap: () {
                                              controller.acceptFriendRequest(request.id.toString(), controller);
                                            },
                                            model: request);
                                      }),
                            ));
                  }),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Business Requests',
                    style: kstyle1.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                  )),
            ),
            Container(
              height: Get.height * .3,
              margin: const EdgeInsets.all(10),
              child: GetBuilder<BusinessRequestsNetworkController>(
                  init: BusinessRequestsNetworkController(),
                  builder: (controller) {
                    return MyWidgetsAnimator(
                        apiCallStatus: controller.apiCallStatus,
                        emptyWidget: () => emptyWidget(onRefresh: controller.getData, requestTitle: "business"),
                        loadingWidget: () => const circular_progressIndicator(),
                        errorWidget: () => Text(controller.errorMessage ?? "Please try again!"),
                        successWidget: () => EasyRefresh(
                              simultaneously: true,
                              controller: controller.controller,
                              onRefresh: controller.onRefresh,
                              header: const ClassicHeader(processedDuration: Duration(milliseconds: 100)),
                              footer: const ClassicFooter(noMoreText: "No more stories"),
                              child: controller.data.userBusinessFollowersRequests!.data?.isEmpty ?? true
                                  ? emptyWidget(onRefresh: controller.getData, requestTitle: "business")
                                  : ListView.builder(
                                      itemCount: controller.data.userBusinessFollowersRequests!.data!.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final Request request = controller.data.userBusinessFollowersRequests!.data![index];

                                        return SingleNetworkCardTile(
                                            onTap: () {
                                              controller.acceptFriendRequest(request.id.toString(), controller);
                                            },
                                            model: request);
                                      }),
                            ));
                  }),
            ),
            const SizedBox(height: 15),
          ]),
        ));
  }

  Widget emptyWidget({required VoidCallback onRefresh, String requestTitle = "follower"}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("There are no $requestTitle request"), TextButton(onPressed: onRefresh, child: const Text("Refresh"))],
      ),
    );
  }
}