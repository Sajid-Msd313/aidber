import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../innovation_detail_screen.dart';
import '../innovation_screen.dart';
class InnovationItem extends StatelessWidget {
  const InnovationItem({Key? key}) : super(key: key);

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
          onTap: ()=>{
            Get.to(InnovationDetailScreen(), transition: Transition.topLevel),
          },
          leading: Image.asset('assets/doctor_lounge.png', height: 100,),
          title: RichText(

            text: const TextSpan(text: 'Lorem ipsum dolor sit amet, consectetuer adipiscing eliasdsad asd as ',
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),
                children: [
                  TextSpan(text: " BreakThrough News", style: TextStyle(fontSize: 11.5, fontStyle: FontStyle.italic, color: Colors.grey,
                      fontWeight: FontWeight.w400))
                ]),
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                height: 6,
              ),
              Text(
                'Added by: Lorem Ipsum',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                '31s',
                style: TextStyle(fontSize: 12),
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