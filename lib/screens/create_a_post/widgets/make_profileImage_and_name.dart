
import 'package:aidber/controllers/storage_controller/storage_controller.dart';
import 'package:aidber/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
class make_profileImage_name extends StatelessWidget {
  const make_profileImage_name({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ClipRRect(
          child:Container(
            height: 55,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(Get.find<storage_controller>().userModel.result != null && Get.find<storage_controller>().userModel.result!.userImage != null? Get.find<storage_controller>().userModel.result!.userImage :  constans.DEFAULT_IMAGE ),
          )),
      SizedBox(width: 5,),
      Text(Get.find<storage_controller>().userModel.result != null && Get.find<storage_controller>().userModel.result!.userName != "" ? Get.find<storage_controller>().userModel.result!.userName.toString(): "User Name",style: kstyle1,)
    ],);
  }
}
