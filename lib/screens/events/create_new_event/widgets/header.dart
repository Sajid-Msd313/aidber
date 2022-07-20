import 'dart:io';

import 'package:aidber/screens/events/controllers/create_new_event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/dimensions.dart';
import '../../../../utils/styles.dart';

class headerCreateEvent extends GetView<CreateNewEventController> {
  const headerCreateEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                  )),
              Text(
                'Edit Profile',
                style: kstyle1.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
        GetBuilder<CreateNewEventController>(builder: (controller) {
          return Container(
              height: 200,
              color: Colors.black12,
              child: Center(
                child: controller.selectedImageFile == null
                    ? InkWell(
                  onTap: ()=>controller.pick_image_gallery(),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.camera_alt,
                              size: 40,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Upload event cover")
                          ],
                        ),
                    )
                    : Image.file(
                        File(controller.selectedImageFile!.path),
                      ),
              ));
        })
      ],
    );
  }
}