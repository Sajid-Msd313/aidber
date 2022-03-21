import 'package:aidber/screens/create_a_post/controller/create_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
class select_gallery_camera_widget extends GetView<create_post_controller> {
  const select_gallery_camera_widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(children: [
      ListTile(
        leading: Icon(Icons.image),
        title: Text("Select From Gallery"),
        onTap: (){
          Get.back();
          controller.pick_image_gallery();
        },
      ),
      ListTile(
        leading: Icon(Icons.camera),
        title: Text("Capture from camera"),
        onTap: (){
          Get.back();
          controller.pick_image_camera();
        },
      ),

    ],);
  }
}
