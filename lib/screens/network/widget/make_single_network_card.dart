import 'package:aidber/global_widgets/cache_network_image.dart';
import 'package:aidber/models/network/follower_requests_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleNetworkCardTile extends StatelessWidget {
  final Request model;
  final VoidCallback onTap;

  const SingleNetworkCardTile({Key? key, required this.model, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * .45,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      //shadowColor: Colors.black,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 2), borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        children: [
          const Spacer(),
          Container(
              height: 90,
              clipBehavior: Clip.hardEdge,
              width: 90,
              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
              child: CacheNetworkImageWidget2(
                shouldUseBuilder: true,
                shouldHaveRadius: true,
                url: model.user?.profilePictureUrl,
              )),
          const Spacer(),
          Text(
            model.user?.fullName ?? "",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          if (model.user?.work != null) Text(model.user?.work ?? ""),
          if (model.user?.address != null) Text(model.user?.address ?? ""),
          const Spacer(flex: 2,),
          FlatButton(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child:  Text(
              model.status == "Pending" ? "Accept" : "Decline",
              style: const TextStyle(fontSize: 14),
            ),
            color: const Color(0xFF282d6b),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            textColor: Colors.white,
            onPressed: onTap,
          ),
        ],
      ),
    );
  }
}