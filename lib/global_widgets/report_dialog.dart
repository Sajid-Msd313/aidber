import 'package:aidber/models/posts/all_posts_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/home_screen/controller/all_post_controller.dart';

class report_dialog extends GetView<all_post_controller> {
  Datum post;

  report_dialog({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: const Icon(
          Icons.more_vert,
          //  size: Get.height*.03,
          color: Colors.grey,
        ),
        customItemsIndexes: const [5],
        customItemsHeight: 8,
        items: [
          ...MenuItems.menuItemList.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item),
            ),
          ),
        ],
        onChanged: (value) {
          MenuItem item = value as MenuItem;
          switch (item) {
            case MenuItems.report:
              controller.reportPost(postId: post.id.toString());
              break;
            case MenuItems.share:
              controller.savePost(postId: post.id.toString());
              break;
            case MenuItems.hide_post:
              controller.hidePost(postId: post.id.toString());
              break;
            case MenuItems.unfollow:
              controller.requestToFollow(postId: post.id.toString());
              break;
            case MenuItems.block:
              controller.blockUser(userId: post.userId.toString());
              break;
          }
        },
        itemHeight: 30,
        itemPadding: const EdgeInsets.only(left: 16, right: 16),
        dropdownWidth: MediaQuery.of(context).size.width * 0.35,
        dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        dropdownElevation: 8,
        offset: const Offset(0, 8),
      ),
    );
  }
}

class MenuItem {
  final String text;
  final IconData? icon;

  const MenuItem({
    required this.text,
    this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> menuItemList = [
    unfollow,
    block,
    hide_post,
    report,
    share
  ];

  static const unfollow = MenuItem(text: 'Unfollow');
  static const hide_post = MenuItem(text: 'Hide Post');
  static const report = MenuItem(text: 'Report');
  static const block = MenuItem(text: 'Block');
  static const share = MenuItem(text: 'Save Post');

  static Widget buildItem(MenuItem item) {
    return Text(
      item.text,
      style: TextStyle(
        color: Colors.grey[600],
      ),
    );
  }

  static onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.report:
        Get.snackbar("Report Demo", "You've reported it");
        break;
        //Do something
        break;
      case MenuItems.share:
        Get.snackbar("Share Demo", "You've shared it");
        break;

        //Do something
        break;
    }
  }
}
