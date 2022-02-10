import 'package:aidber/global_widgets/report_dialog.dart';
import 'package:aidber/screens/home_screen/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class single_post extends StatelessWidget {
  const single_post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
            minVerticalPadding: 10,
            contentPadding: EdgeInsets.zero,
            style: ListTileStyle.drawer,
            leading: ClipRRect(
              child: Image.asset('assets/sajidmsd.jpg'),
              borderRadius: BorderRadius.circular(10),
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: RichText(
                text: const TextSpan(
                    text: "username1",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                          text: "     31s",
                          style: TextStyle(fontSize: 11, color: Colors.black38))
                    ]),
              ),
            ),
            subtitle: Text(
              'And Most Importantly,take good care of yourself first:of your body,mind, and soul!',
            ),
            trailing: const report_dialog(),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            height: MediaQuery.of(context).size.height * 0.3,
            // width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                    image: AssetImage("assets/crazy.jpg"))),
          ),
          const SizedBox(
            height: 10,
          ),
          make_reaction_row()
        ],
      ),
    );
  }
}

class make_reaction_row extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Image.asset(
                "assets/comments.png",
                height: 25,
                width: 25,
              ),
            ),
            GetBuilder<home_controller>(
                init: Get.find<home_controller>(),
                builder: (c) {
                  return InkWell(
                    onTap: () {
                      c.toggle_like();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Image.asset(
                        c.isLiked.value
                            ? "assets/likes.png"
                            : "assets/like.png",
                        height: 25,
                        width: 25,
                      ),
                    ),
                  );
                }),
            Image.asset(
              "assets/share.png",
              height: 25,
              width: 25,
            ),
          ],
        ),
        GetBuilder<home_controller>(
            init: Get.find<home_controller>(),
            builder: (c) {
              return InkWell(
                  onTap: () {
                    c.toggle_save();
                  },
                  child: Image.asset(
                    "assets/save.png",
                    color: c.isSaved.value ? Colors.black : Colors.red,
                    height: 25,
                    width: 25,
                  ));
            }),
      ],
    );
  }
}
