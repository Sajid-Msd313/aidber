import 'package:aidber/global_widgets/report_dialog.dart';
import 'package:aidber/models/posts/all_posts_model.dart';
import 'package:aidber/screens/home_screen/controller/all_post_controller.dart';
import 'package:aidber/screens/home_screen/widgets/make_rounded_text_type.dart';
import 'package:aidber/utils/api_urls.dart';
import 'package:aidber/utils/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../screens/comment_screen/controllers/comment_controller.dart';
import '../utils/utils.dart';
import '../screens/comment_screen/comment_widget.dart';

class single_post extends StatelessWidget {
  Datum singleItemPost;

  single_post({required this.singleItemPost});

  @override
  Widget build(BuildContext context) {
    final String url = singleItemPost.postUrl == null
        ? constans.DEFAULT_IMAGE
        : api_urls.BASE_URL_POSTS + "/" + singleItemPost.postUrl.toString();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
            minVerticalPadding: 10,
            contentPadding: EdgeInsets.zero,
            style: ListTileStyle.drawer,
            leading: ClipRRect(
                child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(constans.DEFAULT_IMAGE),
            )),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    singleItemPost.user!.username??"",
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                        formate_Date1(
                            singleItemPost.updatedAt!.toIso8601String()),
                        style: const TextStyle(
                            fontSize: 13, color: Colors.black38)),
                  ),
                  make_rounded_text_type(text: singleItemPost.type ?? ""),
                ],
              ),
            ),
            trailing: const report_dialog(),
          ),
          const SizedBox(
            height: 5,
          ),
          ReadMoreText(
            singleItemPost.caption ?? "",
            trimLines: 2,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: Colors.black,
            ),
            colorClickableText: Get.theme.primaryColor,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            lessStyle: TextStyle(
                color: Get.theme.primaryColor, fontWeight: FontWeight.bold),
            moreStyle: TextStyle(
                color: Get.theme.primaryColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ), //wala aleka
          if (url != constans.DEFAULT_IMAGE)
            SizedBox(
                // clipBehavior: Clip.antiAlias,
                height: MediaQuery.of(context).size.height * 0.3,
                // width: MediaQuery.of(context).size.width,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(
                      url), //imageViewSinglePost(imagesList: img_urls,)),
                )),
          const SizedBox(
            height: 10,
          ),
          make_reaction_row(
            reactionWidget: reactions.getReactionByValue(singleItemPost.isLiked??-1),
            postId: singleItemPost.id.toString(),
          )
        ],
      ),
    );
  }
}

reactionWidgetCheck(int reacted){
  switch(reacted){
    case 1 :
      return Reaction<String>(
        value: '1',
        title: const Text(
          "Heart",
          style: TextStyle(color: Colors.red),
        ),
        previewIcon: const FaIcon(
          FontAwesomeIcons.solidHeart,
          color: Colors.red,
        ),
        icon: const FaIcon(
          FontAwesomeIcons.heart,
        ),
      );
    case 2 :
      return Reaction<String>(
        value: '2',
        title: const Text(
          "Heart",
          style: TextStyle(color: Colors.red),
        ),
        previewIcon: const FaIcon(
          FontAwesomeIcons.solidHeart,
          color: Colors.red,
        ),
        icon: const FaIcon(
          FontAwesomeIcons.heart,
        ),
      );

  }

}

class make_like_button extends StatefulWidget {
  Reaction<String> reactionWidget;
  String postId;

  make_like_button({required this.reactionWidget, required this.postId});

  @override
  _make_like_buttonState createState() => _make_like_buttonState();
}

class _make_like_buttonState extends State<make_like_button> {
  toggle_like(String reactionType) async {
    //  widget.isLiked = !widget.isLiked;
    await Get.find<all_post_controller>()
        .reactAPost(postId: widget.postId, reactionType: reactionType);
    //setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ReactionButtonToggle<String>(
      boxPosition: Position.TOP,
      itemScale: 0.9,
      boxPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      onReactionChanged: (String? value, bool isChecked) {
        //toggle_like();
        toggle_like(value.toString());
        print('Selected value: $value, isChecked: $isChecked');
      },
      reactions: <Reaction<String>>[
        Reaction<String>(
          value: '1',
          title: const Text(
            "Heart",
            style: TextStyle(color: Colors.red),
          ),
          previewIcon: const FaIcon(
            FontAwesomeIcons.solidHeart,
            color: Colors.red,
          ),
          icon: const FaIcon(
            FontAwesomeIcons.solidHeart,
            color: Colors.red,
          ),
        ),
        Reaction<String>(
          value: '2',
          title: const Text(
            "Good Luck",
            style: TextStyle(color: Colors.deepPurpleAccent),
          ),
          previewIcon: const FaIcon(
            FontAwesomeIcons.clover,
            color: Colors.deepPurpleAccent,
          ),
          icon: const FaIcon(
            FontAwesomeIcons.clover,
            color: Colors.deepPurpleAccent,
          ),
        ),
        Reaction<String>(
          value: '3',
          title:
              const Text("Get Well Soon", style: TextStyle(color: Colors.red)),
          previewIcon: const FaIcon(
            FontAwesomeIcons.appleWhole,
            color: Colors.red,
          ),
          icon: const FaIcon(
            FontAwesomeIcons.appleWhole,
            color: Colors.red,
          ),
        ),
        Reaction<String>(
          value: '4',
          title:
              Text("Clapping", style: TextStyle(color: Colors.yellow.shade700)),
          previewIcon: FaIcon(
            FontAwesomeIcons.handsClapping,
            color: Colors.yellow.shade700,
          ),
          icon: FaIcon(FontAwesomeIcons.handsClapping,
              color: Colors.yellow.shade700),
        ),
        Reaction<String>(
          value: '5',
          title: Text("Happy", style: TextStyle(color: Colors.yellow.shade700)),
          previewIcon: FaIcon(
            FontAwesomeIcons.faceSmileBeam,
            color: Colors.yellow.shade700,
          ),
          icon: FaIcon(FontAwesomeIcons.faceSmileBeam,
              color: Colors.yellow.shade700),
        ),
      ],
      initialReaction: widget.reactionWidget,
    );
  }
}

class make_save_button extends StatefulWidget {
  bool isSaved;

  make_save_button({required this.isSaved});

  @override
  _make_save_buttonState createState() => _make_save_buttonState();
}

class _make_save_buttonState extends State<make_save_button> {
  toggle_save() {
    widget.isSaved = !widget.isSaved;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        toggle_save();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Image.asset(
          "assets/save.png",
          color: widget.isSaved ? Colors.red : Colors.black,
          height: 25,
          width: 25,
        ),
      ),
    );
  }
}

class make_reaction_row extends StatelessWidget {
  String postId;
  Reaction<String> reactionWidget;

  make_reaction_row({required this.reactionWidget, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            make_like_button(
              reactionWidget: reactionWidget,
              postId: postId,
            ),
            InkWell(
              onTap: ()=>Get.to(()=>comment_widget(postId: postId,),transition: Transition.downToUp, binding:BindingsBuilder(() => {Get.put(comment_controller())})),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Image.asset(
                  "assets/comment.png",
                  height: 30,
                  width: 40,
                ),
              ),
            ),
            Image.asset(
              "assets/share.png",
              height: 22,
              width: 22,
            ),
          ],
        ),
        // make_save_button(isSaved: false,)
      ],
    );
  }
}

//TODO implement it for list of images...
class imageViewSinglePost extends StatefulWidget {
  List<String> imagesList;

  imageViewSinglePost({required this.imagesList});

  @override
  _imageViewSinglePostState createState() => _imageViewSinglePostState();
}

class _imageViewSinglePostState extends State<imageViewSinglePost> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.imagesList
          .map(
            (p) => Image.network(
              api_urls.BASE_URL_POSTS + "/" + p,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          )
          .toList(),
      options: CarouselOptions(
        viewportFraction: 1.0,
        enlargeCenterPage: false,
        initialPage: 0,
        // onPageChanged: (index, reason) {
        //   setState(() {
        //     currentIndex = index;
        //     _product = _products[index];
        //   });
        // },
      ),
    );
  }
}
