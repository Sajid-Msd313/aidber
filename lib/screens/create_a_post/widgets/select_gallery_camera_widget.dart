import 'package:aidber/screens/create_a_post/controller/create_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectGalleryCamera_CreatePostWidget extends GetView<create_post_controller> {
  const SelectGalleryCamera_CreatePostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.image),
          title: const Text("Select From Gallery"),
          onTap: () {
            Get.back();
            controller.pick_image_gallery();
          },
        ),
        ListTile(
          leading: const Icon(Icons.camera),
          title: const Text("Capture from camera"),
          onTap: () {
            Get.back();
            controller.pick_image_camera();
          },
        ),
      ],
    );
  }
}

///Controller must contain [pick_image_gallery()] and [pick_image_camera()] methods..
class SelectGalleryCameraWidget extends StatelessWidget {
  var controller;

  SelectGalleryCameraWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.image),
          title: const Text("Select From Gallery"),
          onTap: () {
            Get.back();
            controller.pick_image_gallery();
          },
        ),
        ListTile(
          leading: const Icon(Icons.camera),
          title: const Text("Capture from camera"),
          onTap: () {
            Get.back();
            controller.pick_image_camera();
          },
        ),
      ],
    );
  }
}