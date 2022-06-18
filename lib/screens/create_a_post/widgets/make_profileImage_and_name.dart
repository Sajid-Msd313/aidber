import 'package:aidber/controllers/storage_controller/storage_controller.dart';
import 'package:aidber/screens/create_a_post/controller/create_post_controller.dart';
import 'package:aidber/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aidber/utils/extension.dart';
class make_profileImage_name extends StatelessWidget {
  final Function callBackRemoveAddress;
  final Function callBackRemoveLink;

  make_profileImage_name(
      {required this.callBackRemoveAddress, required this.callBackRemoveLink});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
              child: Container(
            height: 55,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
                Get.find<storage_controller>().userModel.result != null &&
                        Get.find<storage_controller>()
                                .userModel
                                .result!
                                .userImage !=
                            null
                    ? Get.find<storage_controller>().userModel.result!.userImage
                    : constans.DEFAULT_IMAGE),
          )),
          SizedBox(
            width: 5,
          ),
          Flexible(
            child: GetBuilder<create_post_controller>(
                init: Get.find<create_post_controller>(),
                builder: (controller) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text.rich(

                        TextSpan(
                          children: [
                            TextSpan(
                                text: Get.find<storage_controller>()
                                                .userModel
                                                .result !=
                                            null &&
                                        Get.find<storage_controller>()
                                                .userModel
                                                .result!
                                                .userName !=
                                            ""
                                    ? Get.find<storage_controller>()
                                        .userModel
                                        .result!
                                        .userName
                                        ?.toTitleCase()
                                    : "User Name",
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                      if(controller.selectedPeopleNames.isNotEmpty)      const TextSpan(text: ' is with '),
                            if(controller.selectedPeople.isNotEmpty)      TextSpan(
                                text: controller.selectedPeople.length == 1
                                    ? controller.selectedPeople.first?.name
                                    : controller.selectedPeople.join(", "),
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        softWrap: true,
                      ),
                      controller.address == ""
                          ? Container()
                          : _spanIcon(
                              controller.address, callBackRemoveAddress),
                      controller.link == ""
                          ? Container()
                          : _spanIcon(controller.link, callBackRemoveLink,
                              icon: Icons.link),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget _spanIcon(String text, callBack, {icon: Icons.location_on}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 14),
        SizedBox(
          width: 6,
        ),
        Flexible(
            child: Text(
          text,
          maxLines: 3,
        )),
        SizedBox(
          width: 6,
        ),
        InkWell(
          onTap: callBack,
          child: Text(
            "Remove",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Theme.of(Get.context!).primaryColor),
          ),
        )
      ],
    );
  }
}
