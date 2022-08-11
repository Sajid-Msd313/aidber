import 'package:aidber/controllers/storage_controller/storage_controller.dart';
import 'package:aidber/global_widgets/cache_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../profile_view/controllers/profile_controller.dart';
import '../../profile_view/profile_view_MainScreen.dart';

class headerMenu extends StatelessWidget {
  const headerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? username = Get.find<storage_controller>().getUserName()?.toUpperCase();
    String? profileImage = Get.find<storage_controller>().getProfileImage();

    return Column(
      children: [
        ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10), // Image border
            child: SizedBox.fromSize(
                size: const Size.fromRadius(30), //
                child: CacheNetworkImageWidget(url: profileImage ?? "") // Image radius

                ),
          ),
          title: Text(
            username ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: InkWell(
              onTap: () =>
                  Get.to(() => const profile_page_mainScreen(), binding: BindingsBuilder(() => {Get.put(profile_controller())})),
              child: const Text("View Profile")),
        ),
      ],
    );
  }
}