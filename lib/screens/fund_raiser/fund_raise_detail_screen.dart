import 'package:aidber/global_widgets/colors.dart';
import 'package:aidber/global_widgets/custom_button.dart';
import 'package:aidber/screens/fund_raiser/add_fund_raiser.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

class FundRaiserDetailScreen extends StatelessWidget {
  const FundRaiserDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
            _ImageCard(context),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Lorem ipsum dolor sit amet, consectetur adilpisici",
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            makeProgressBar(context),
            TitleWithChild(
                titleStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                title: "Description",
                child: Text(
                  "Lorem ipsum dolor sit am consectur asd" * 30,
                  style: const TextStyle(fontSize: 13),
                )),
            _VideoWidget(context),
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
        ));
  }

  //VIDEO WIDGET

  _VideoWidget(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),

      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.of(context).size.width,
      child: const Icon(Icons.video_collection_outlined,color: Colors.white, size: 100),
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

  _ImageCard(context) {
    return Stack(
      children: [
        _ImageView(context),
        _ImageFooter(context),
        const Positioned(left: 5, top: 5, child: BackButton(color: Colors.white))
      ],
    );
  }

  _ImageView(context) {
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
        child: Image.asset(
          "assets/mark.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
    //return Image.asset("assets/mark.jpg",fit: BoxFit.cover,);
  }
}