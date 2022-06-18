import 'package:aidber/screens/home_screen/home_screen_view.dart';
import 'package:aidber/screens/hot_topics/hot_topics.dart';
import 'package:aidber/screens/menu/menu_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../screens/create_a_post/create_post_screen.dart';
import '../screens/network/network_screen.dart';

class root_page_controller extends GetxController {
  PersistentTabController navBar_controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> buildScreens() {
    return [
      HomeScreenView(),
      const Network_Screen(),
      const create_post_screen(),
      const hot_topics(),
      const MenuScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: Get.theme.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person_2),
        title: ("Connect"),
        activeColorPrimary: Get.theme.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.add_circled_solid,
        ),

        iconSize: 35,
        onPressed: (_) {
          Get.to(()=>const create_post_screen(), transition: Transition.cupertinoDialog,duration: 200.milliseconds);
        },
        //  title: ("Settings"),
        activeColorPrimary: Get.theme.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.whatshot_outlined),
        title: ("Hot Topics"),
        activeColorPrimary: Get.theme.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.rectangle_grid_2x2),
        title: ("Menu"),
        activeColorPrimary: Get.theme.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
