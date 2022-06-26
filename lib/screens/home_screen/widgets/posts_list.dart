import 'package:aidber/global_widgets/single_post.dart';
import 'package:aidber/screens/home_screen/controller/all_post_controller.dart';
import 'package:aidber/utils/api_urls.dart';
import 'package:aidber/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PostsList extends StatefulWidget {
  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {

  on_callback(bool value){

  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<all_post_controller>(builder: (controller) {
      if (controller.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (controller.getAllPost.data == null ||
          controller.getAllPost.data!.isEmpty ) {
        return Center(
          child: Text("No posts available"),
        );
      }

      return Container(
        height: Get.height,
        // width: 300,
        child: SmartRefresher(
          //    enablePullDown: true,
          enablePullUp: true,

          header:  WaterDropHeader(
            completeDuration: 100.milliseconds,
            waterDropColor: Theme.of(context).primaryColor,
            complete: const SizedBox.shrink(),
          ),
          footer: CustomFooter(
            builder: (BuildContext context, LoadStatus? mode) {
              Widget body;
              if (mode == LoadStatus.idle) {
                body = const Text("pull up load");
              } else if (mode == LoadStatus.loading) {
                body = const CupertinoActivityIndicator();
              } else if (mode == LoadStatus.failed) {
                body = const Text("Load Failed!Click retry!");
              } else if (mode == LoadStatus.canLoading) {
                body = const Text("release to load more");
              } else {
                body = const Text("No more Data");
              }
              return Container(
                height: 55.0,
                child: Center(child: body),
              );
            },
          ),
          // physics: NeverScrollableScrollPhysics(),
          controller: controller.refreshController,
          onRefresh: controller.onRefresh,
          onLoading: controller.onLoading,
          child: ListView.builder(
            primary: true,
            //   physics: const NeverScrollableScrollPhysics(),
            addAutomaticKeepAlives: false,
            padding: const EdgeInsets.all(4),
            shrinkWrap: true,
            cacheExtent: 50,
            scrollDirection: Axis.vertical,
            itemCount: controller.getAllPost.data!.length,
            itemBuilder: (context, int index) {
            //  print(controller.getAllPost.data![index].postUrl);
              return single_post(
                 singleItemPost: controller.getAllPost.data![index]);
            },
          ),
        ),
      );
    });
  }
}
