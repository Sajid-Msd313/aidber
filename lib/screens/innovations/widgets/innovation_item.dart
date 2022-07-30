import 'package:aidber/global_widgets/cache_network_image.dart';
import 'package:aidber/models/innovations/innovation_item_model.dart';
import 'package:aidber/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../innovation_detail_screen.dart';

class InnovationItemTile extends StatelessWidget {
  final InnovationItemModel model;

  const InnovationItemTile({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
              splashRadius: 20,
              padding: EdgeInsets.zero,
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              onPressed: () => {},
              icon: const FaIcon(FontAwesomeIcons.ellipsisVertical, color: Colors.grey, size: 15)),
        ),
        ListTile(
          onTap: () => {
            Get.to( InnovationDetailScreen(model: model), transition: Transition.topLevel),
          },
          leading: CacheNetworkImageWidget(
            url:model.innovationImages?.isNotEmpty??false ?model.innovationImages?.first.content : "",
          ),
          title: RichText(
            text:  TextSpan(
                text:"${model.title }asasd ",
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                children: [
                  TextSpan(
                      text: " ${model.category}",
                      style:  TextStyle(fontSize: 11.5, fontStyle: FontStyle.italic, color: Colors.grey.shade600, fontWeight: FontWeight
                          .w400))
                ]),
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
             const  SizedBox(
                height: 6,
              ),
            const  Text(
                'Added by: Lorem Ipsum',
                style: TextStyle(fontSize: 12),
              ),
            const  SizedBox(
                height: 12,
              ),
              Text(
                dateFormateAgo(model.createdAt),
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          trailing: const SizedBox(),
        ),
        Positioned(
            bottom: -5,
            right: 0,
            child: Row(
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    visualDensity: const VisualDensity(horizontal: -4, vertical: -3),
                    onPressed: () => {},
                    splashRadius: 20,
                    icon: const FaIcon(FontAwesomeIcons.share, color: Colors.grey, size: 15)),
                IconButton(
                    padding: EdgeInsets.zero,
                    visualDensity: const VisualDensity(horizontal: -4, vertical: -3),
                    onPressed: () => {},
                    splashRadius: 20,
                    icon: const FaIcon(FontAwesomeIcons.bookmark, color: Colors.grey, size: 15)),
              ],
            )),
      ],
    );
  }
}