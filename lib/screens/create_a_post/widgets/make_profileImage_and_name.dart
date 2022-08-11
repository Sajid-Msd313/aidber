import 'package:aidber/controllers/storage_controller/storage_controller.dart';
import 'package:aidber/screens/create_a_post/controller/create_post_controller.dart';
import 'package:aidber/screens/home_screen/controller/all_post_controller.dart';
import 'package:aidber/utils/constants.dart';
import 'package:aidber/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class make_profileImage_name extends StatelessWidget {
  final Function callBackRemoveAddress;
  final Function callBackRemoveLink;
  final String? businessName;

  const make_profileImage_name({Key?key,required this.callBackRemoveAddress, required this.callBackRemoveLink, this.businessName}) :
        super(key: key);

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
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.network(Get.find<storage_controller>().userModel.result != null &&
                    Get.find<storage_controller>().userModel.result!.userImage != null
                ? Get.find<storage_controller>().userModel.result!.userImage
                : constans.DEFAULT_IMAGE),
          )),
          const SizedBox(
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
                                text: businessName != null
                                    ? businessName
                                    : Get.find<storage_controller>().userModel.result != null &&
                                            Get.find<storage_controller>().userModel.result!.userName != ""
                                        ? Get.find<storage_controller>().userModel.result!.userName?.toTitleCase()
                                        : "User Name",
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                            if (controller.selectedPeopleNames.isNotEmpty) const TextSpan(text: ' is with '),
                            if (controller.selectedPeople.isNotEmpty)
                              TextSpan(
                                  text: controller.selectedPeople.length == 1
                                      ? controller.selectedPeople.first!.name
                                    //  : controller.selectedPeople.value.length.toString(),
                                      : controller.selectedPeople.map((e) => e!.name).join(', '),
                                  style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        softWrap: true,
                      ),
                      controller.address == "" ? const SizedBox.shrink() : textIcon(controller.address, callBackRemoveAddress),
                      controller.link == ""
                          ? const SizedBox.shrink()
                          : textIcon(controller.link, callBackRemoveLink, icon: Icons.link),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget textIcon(String text, callBack, {icon: Icons.location_on}) {
    return Text.rich(TextSpan(children: [
      WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Icon(icon),
          )),
      TextSpan(text: text),
      WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: InkWell(
            onTap: callBack,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                "Remove",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Theme.of(Get.context!).primaryColor),
              ),
            ),
          )),
    ]));
  }
}