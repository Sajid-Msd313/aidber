import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/single_post.dart';
import '../edit_profile/edit_profile_view.dart';
import '../view_page/widgets/make_column_follow_widget.dart';
import 'controllers/profile_controller.dart';

class profile_page_mainScreen extends GetView<profile_controller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 0,
                backwardsCompatibility: true,
                backgroundColor: Colors.transparent,
                expandedHeight: Get.height * .5,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    color: Theme.of(context).primaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            onPressed: () => Get.back(),
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                // Image border
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(80),
                                  // Image radius
                                  child: Image.asset('assets/sajidmsd.jpg',
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    make_column_follow(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      textColor: Colors.white,
                                      subtitle:
                                          controller.myProfileModel.data == null
                                              ? "0"
                                              : controller.myProfileModel.data!
                                                  .followers
                                                  .toString(),
                                      heading: "Community",
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      controller.myProfileModel.data == null
                                          ? 'Name'
                                          : controller.myProfileModel.data!
                                                  .fullName ??
                                              '',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                          wordSpacing: 2,
                                          fontSize: 24),
                                    ),
                                    Text(
                                      controller.myProfileModel.data == null
                                          ? ''
                                          : controller
                                              .myProfileModel.data!.country
                                              .toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          wordSpacing: 2,
                                          fontSize: 18),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Visibility(
                                      visible: controller.myProfileModel.data !=
                                          null,
                                      child: RichText(
                                          text: TextSpan(children: [
                                        const WidgetSpan(
                                          child: Padding(
                                            padding: EdgeInsets.only(right: 4),
                                            child: Icon(
                                              Icons.location_on,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              controller.myProfileModel.data ==
                                                      null
                                                  ? 'Location not specified'
                                                  : controller.myProfileModel
                                                      .data!.country
                                                      .toString(),
                                        ),
                                      ])),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: controller.myProfileModel.data != null,
                          child: Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 20, right: 20),
                              child: AutoSizeText(
                                "lOREM ipsum asdias dasd sad" * 3,
                                maxLines: 4,
                                style: const TextStyle(
                                    color: Colors.white,
                                    wordSpacing: 2,
                                    fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(50, 30),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                alignment: Alignment.centerLeft),
                            onPressed: () => Get.to(() => const EditProfile()),
                            child: const Text("Edit profile",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                    fontSize: 14)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: GetBuilder<profile_controller>(
              init: Get.find<profile_controller>(),
              builder: (controller) {
                if (controller.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (controller.postList.isEmpty) {
                  return const Center(
                    child: Text("No Posts"),
                  );
                }
                return Text(
                    "Need Api Changes, below uncomment if ok ${controller.postList.length}");
                return ListView.builder(
                  primary: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  addAutomaticKeepAlives: false,
                  padding: const EdgeInsets.all(4),
                  shrinkWrap: true,
                  cacheExtent: 50,
                  scrollDirection: Axis.vertical,
                  itemCount: controller.myProfileModel.data?.posts?.length,
                  itemBuilder: (context, int index) {
                    //  print(controller.getAllPost.data![index].postUrl);
                    return single_post(
                        singleItemPost:
                            controller.myProfileModel.data!.posts![index]);
                  },
                );
              }),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
