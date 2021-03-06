import 'package:aidber/global_widgets/single_post.dart';
import 'package:aidber/screens/home_screen/controller/all_post_controller.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PostsList extends StatefulWidget {
  const PostsList({Key? key}) : super(key: key);

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<all_post_controller>(builder: (controller) {
      if (controller.isLoading) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      if (controller.getAllPost.data == null || controller.getAllPost.data!.data == null) {
        return SizedBox(
          height: Get.height,
          child: Center(
            child: CircleAvatar(
              radius: 30,
              child: IconButton(
                onPressed: () => controller.fetch_allPosts(isInitial: true),
                icon: const FaIcon(
                  FontAwesomeIcons.refresh,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      }

      return SizedBox(
          height: Get.height,
          // width: 300,
          child: EasyRefresh(

            simultaneously: true,
            controller: controller.controller,
            onRefresh: controller.onRefresh,
            onLoad: controller.onLoading,
            header:const ClassicHeader(

                processedDuration:  Duration(milliseconds: 100)
            ),
            footer: const ClassicFooter(

              noMoreText: "No more Posts",
            ),
            child: ListView.builder(
              primary: true,
              //   physics: const NeverScrollableScrollPhysics(),
              addAutomaticKeepAlives: false,
              padding: const EdgeInsets.all(4),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: controller.allPostsList.length,
              itemBuilder: (context, int index) {
                //  print(controller.getAllPost.data![index].postUrl);
                return single_post(singleItemPost: controller.allPostsList[index]);
              },
            ),
          ));
      //
      // return SizedBox(
      //   height: Get.height,
      //   // width: 300,
      //
      //   child: SmartRefresher(
      //     //    enablePullDown: true,
      //     enablePullUp: true,
      //
      //     header:  WaterDropHeader(
      //       completeDuration: 100.milliseconds,
      //       waterDropColor: Theme.of(context).primaryColor,
      //       complete: const SizedBox.shrink(),
      //     ),
      //     footer: CustomFooter(
      //       builder: (BuildContext context, LoadStatus? mode) {
      //         Widget body;
      //         if (mode == LoadStatus.idle) {
      //           body = const Text("pull up load");
      //         } else if (mode == LoadStatus.loading) {
      //           body = const CupertinoActivityIndicator();
      //         } else if (mode == LoadStatus.failed) {
      //           body = const Text("Load Failed!Click retry!");
      //         } else if (mode == LoadStatus.canLoading) {
      //           body = const Text("release to load more");
      //         } else {
      //           body = const Text("No more Data");
      //         }
      //         return SizedBox(
      //           height: 55.0,
      //           child: Center(child: body),
      //         );
      //       },
      //     ),
      //     // physics: NeverScrollableScrollPhysics(),
      //     controller: controller.refreshController,
      //     onRefresh: controller.onRefresh,
      //     onLoading: controller.onLoading,
      //     child: ListView.builder(
      //       primary: true,
      //       //   physics: const NeverScrollableScrollPhysics(),
      //       addAutomaticKeepAlives: false,
      //       padding: const EdgeInsets.all(4),
      //       shrinkWrap: true,
      //       cacheExtent: 50,
      //       scrollDirection: Axis.vertical,
      //       itemCount: controller.allPostsList.length,
      //       itemBuilder: (context, int index) {
      //       //  print(controller.getAllPost.data![index].postUrl);
      //         return single_post(
      //            singleItemPost: controller.allPostsList[index]);
      //       },
      //     ),
      //   ),
      // );
    });
  }
}