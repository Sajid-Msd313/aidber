import 'dart:math';

import 'package:aidber/global_widgets/outlined_button.dart';
import 'package:aidber/screens/home_screen/widgets/posts_list.dart';
import 'package:aidber/screens/view_page/view_page_main_screen.dart';
import 'package:aidber/screens/view_page/widgets/make_profile_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class view_page_mainScreen extends StatefulWidget {
  @override
  _view_page_mainScreenState createState() => _view_page_mainScreenState();
}

class _view_page_mainScreenState extends State<view_page_mainScreen> {
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: DefaultTabController(
          length: 5,
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  elevation: 0,

                  backwardsCompatibility: true,
                  backgroundColor: Colors.transparent,
                  expandedHeight: Get.height*.6,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    background: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: Get.height * .47,
                          width: Get.width,
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/cover_photo.jpg",
                                fit: BoxFit.fitWidth,
                                height: Get.height * .3,
                                width: Get.width,
                              ),
                              Positioned(
                                  top: Get.height * .02,
                                  left: 0,
                                  child: InkWell(
                                    onTap: () {
                                      print("get back");
                                      Get.back();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "assets/back.png",
                                        color: Colors.white,
                                        height: 30,
                                      ),
                                    ),
                                  )),
                              Positioned(
                                  top: Get.height * .26,
                                  child: const make_profile_header()),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 0, left: 15, right: 15, bottom: 8),
                              child: Text(
                                "Lorem Ipsum is test very" * 10,
                                maxLines: 2,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                    width: Get.width * .4,
                                    child: outlined_button(
                                      txt: "Follow",
                                      ontap: () {},
                                      color: Get.theme.primaryColor,
                                    )),
                                SizedBox(
                                    width: Get.width * .4,
                                    child: outlined_button(
                                      txt: "Message",
                                      ontap: () {},
                                      color: Get.theme.primaryColor,
                                    ))
                              ],
                            ),


                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(

                  delegate: _SliverAppBarDelegate(
                    minHeight: 50.0,
                    maxHeight: 60.0,
                    child: Container(
                      color: Colors.white,
                      child: TabBar(
                        unselectedLabelColor: Colors.grey.shade700,
                        indicatorColor:  Get.theme.primaryColor,
                        indicatorWeight: 4.0,
                        labelColor: Get.theme.primaryColor,
                        controller: _tabController,
                        isScrollable: true,
                        tabs:const [
                          Tab(
                            text: "Home",
                          ),
                          Tab(
                            text: "Overview",
                          ),
                          Tab(
                            text:   "Photos/Videos",

                          ),
                          Tab(
                            text: "Blogs",

                          ),
                          Tab(
                            text: "Job Posts",



                          ),
                        ],
                        indicatorSize: TabBarIndicatorSize.tab,
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: PostsList(),
          ),
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
