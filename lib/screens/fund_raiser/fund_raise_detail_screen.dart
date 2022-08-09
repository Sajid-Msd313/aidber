import 'package:aidber/data/services/fund_raiser/fund_raiser_detail.dart';
import 'package:aidber/global_widgets/cache_network_image.dart';
import 'package:aidber/global_widgets/colors.dart';
import 'package:aidber/global_widgets/custom_button.dart';
import 'package:aidber/screens/fund_raiser/add_fund_raiser.dart';
import 'package:aidber/screens/fund_raiser/controllers/fund_raiser_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

import '../../global_widgets/my_widget_animator.dart';

class FundRaiserDetailScreen extends StatelessWidget {
  final String id;

  FundRaiserDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: GetBuilder<FundRaiserDetailController>(
          init: FundRaiserDetailController(id: id),
          builder: (controller) {
            return MyWidgetsAnimator(
              emptyWidget: () => const Center(
                child: Text("No data found"),
              ),
              apiCallStatus: controller.apiCallStatus,
              loadingWidget: () => Center(
                child: CircularProgressIndicator(
                  color: PRIMARY_COLOR,
                ),
              ),
              errorWidget: () => const Center(
                child: Text('Something went wrong!'),
              ),
              successWidget: () => _fundRaiserDetailItem(context, controller.data),
            );
          },
        ));
  }

  _fundRaiserDetailItem(BuildContext context, FundRaiserDetailModel model) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
        _ImageCard(context, model.data?.fundRaiserImages),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(model.data?.title ?? "",
              textAlign: TextAlign.left, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        makeProgressBar(context),
        TitleWithChild(
            titleStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            title: "Description",
            child: Text(
              model.data?.fundRaiserDesc ?? "No description",
              style: const TextStyle(fontSize: 13),
            )),
        _VideoWidget(context, videos: model.data?.fundRaiserVideos),
        const SizedBox(height: 20),
        Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: CustomButton4(
                onTap: () {},
                padding: const EdgeInsets.symmetric(vertical: 10),
                text: 'Contribute',
                fontSize: 16,
                width: MediaQuery.of(context).size.width * .5,
                color: Theme.of(context).primaryColor,
                disableBorder: true)),
        const SizedBox(height: 20)
      ]),
    );
  }

  //VIDEO WIDGET

  _VideoWidget(context, {List<FundRaiser>? videos}) {
    if (videos == null || videos.isEmpty) {
      return Container();
    }
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.of(context).size.width,
      child: IconButton(
        onPressed: () {
          print(videos.first.content);
        },
        icon: const Icon(Icons.video_collection_outlined, color: Colors.white, size: 100),
      ),
    );
  }

  ///PROGRESS BAR
  makeProgressBar(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text("Target: \$ 3000", style: TextStyle(fontSize: 15, color: Colors.grey)),
          const SizedBox(
            height: 5,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(25)),
              child: const ProgressBar(
                  value: 0.7,
                  gradient: LinearGradient(
                      begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Colors.green, Colors.greenAccent]))),
          const SizedBox(
            height: 10,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "\$ 3000 raised",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }

  //IMAGES WORK BELOW
  _ImageFooter(context) {
    return Positioned(
        left: 5,
        right: 0,
        bottom: 5,
        child: Container(
          alignment: Alignment.topCenter,
          color: Colors.white.withOpacity(.8),
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.favorite, color: Colors.red, size: 25),
              const SizedBox(
                width: 10,
              ),
              Text("Contribute", style: TextStyle(color: PRIMARY_COLOR, fontWeight: FontWeight.w600)),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {},
                icon: FaIcon(FontAwesomeIcons.share, color: PRIMARY_COLOR, size: 23),
              ),
            ],
          ),
        ));
  }

  _ImageCard(context, List<FundRaiser>? images) {
    if (images == null || images.isEmpty) return Container();
    return Stack(
      children: [
        _ImageView(context, images.first.content ?? ""),
        _ImageFooter(context),
        const Positioned(left: 5, top: 5, child: BackButton(color: Colors.white))
      ],
    );
  }

  _ImageView(context, String imgUrl) {
    return Container(
      padding: const EdgeInsets.all(10),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20), // Image border
        child: CacheNetworkImageWidget2(
          url: imgUrl,
        ),
      ),
    );
    //return Image.asset("assets/mark.jpg",fit: BoxFit.cover,);
  }
}