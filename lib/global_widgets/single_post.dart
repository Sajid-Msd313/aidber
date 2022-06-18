import 'package:aidber/global_widgets/report_dialog.dart';
import 'package:aidber/screens/home_screen/controller/all_post_controller.dart';
import 'package:aidber/screens/home_screen/controller/home_controller.dart';
import 'package:aidber/screens/home_screen/widgets/make_rounded_text_type.dart';
import 'package:aidber/utils/api_urls.dart';
import 'package:aidber/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../utils/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';


class single_post extends StatelessWidget {
  final String img_url;
  final String post_type;
  final String time;
  final String caption;
  final String user_name;
  final bool isLiked;

  single_post(
      {required this.caption,
        required this.isLiked,
      required this.img_url,
      required this.post_type,
      required this.time,
      required this.user_name});

  @override
  Widget build(BuildContext context) {
    print(img_url);
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
                  const Text(
                    "username1",
                    style: TextStyle(
                      fontSize: 15,
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(formate_Date1(time),
                        style: TextStyle(fontSize: 13, color: Colors.black38)),
                  ),
                  make_rounded_text_type(text: post_type),
                ],
              ),
            ),
            trailing: const report_dialog(),
          ),
          const SizedBox(
            height: 5,
          ),
          ReadMoreText(
            caption,
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
       if(img_url != constans.DEFAULT_IMAGE)   SizedBox(
            // clipBehavior: Clip.antiAlias,
            height: MediaQuery.of(context).size.height * 0.3,
            // width: MediaQuery.of(context).size.width,
            child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(img_url),  //imageViewSinglePost(imagesList: img_urls,)),
            ) ),
          const SizedBox(
            height: 10,
          ),
          make_reaction_row(isLiked: isLiked,timestamp: time,)
        ],
      ),
    );
  }
}

class make_like_button extends StatefulWidget {
  bool isLiked;
  String timestamp;
 make_like_button({required this.isLiked, required this.timestamp});

  @override
  _make_like_buttonState createState() => _make_like_buttonState();
}

class _make_like_buttonState extends State<make_like_button> {

  toggle_like(){
    widget.isLiked = !widget.isLiked;
    Get.find<all_post_controller>().update_likePost(timeStampISO: widget.timestamp);
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        toggle_like();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Image.asset(
          widget.isLiked
              ? "assets/likes.png"
              : "assets/like.png",
          height: 27,
          width: 27,
        ),
      ),
    );
  }
}


class make_save_button extends StatefulWidget {
  bool isSaved ;
  make_save_button({required this.isSaved});

  @override
  _make_save_buttonState createState() => _make_save_buttonState();
}

class _make_save_buttonState extends State<make_save_button> {
  toggle_save(){
    widget.isSaved = !widget.isSaved;
    setState(() {
    });
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
          color:widget.isSaved? Colors.red : Colors.black,
          height: 25,
          width: 25,
        ),
      ),
    );
  }
}


class make_reaction_row extends StatelessWidget {
  String timestamp;
  bool isLiked;
  make_reaction_row({required this.isLiked,required this.timestamp});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            make_like_button(isLiked:isLiked,timestamp: timestamp,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Image.asset(
                "assets/comment.png",
                height: 30,
                width: 40,
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
              api_urls.BASE_URL_POSTS + "/" +p,
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
