import 'package:aidber/global_widgets/appbar.dart';
import 'package:aidber/global_widgets/cache_network_image.dart';
import 'package:aidber/global_widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../global_widgets/colors.dart';

class FundRaiserMainScreen extends StatelessWidget {
  const FundRaiserMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Raise Funds',
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 15,
          ),
          _titleWidget("Successful Stories"),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25), child: successfulStoriesMainCard(context)),
          imageShowCaseListView(),

          ///BUTTON
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: CustomButton4(
              onTap: () {},
              padding: const EdgeInsets.symmetric(vertical: 10),
              text: 'Request For Funds',
              fontSize: 16,
              width: MediaQuery.of(context).size.width * .5,
              color: Theme.of(context).primaryColor,
              disableBorder: true,
            ),
          ),
          _titleWidget("Fundraisers stories"),

          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return fundRaiserStoriesCard();
                  }))
        ],
      ),
    );
  }

  ///TITLES IN SCREEN
  _titleWidget(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'Futura'),
      ),
    );
  }

  ///First Card in the screen
  successfulStoriesMainCard(context) {
    return IntrinsicHeight(
      child: Card(
          color: Colors.grey.shade200,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          // margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          clipBehavior: Clip.antiAlias,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Person got a  new life after liver transplant. Thank you to all who contributed generously.",
                          textAlign: TextAlign.center, style: TextStyle(fontSize: 13)),
                      const SizedBox(height: 15),
                      Text("Collected\n\$ 500000", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: PRIMARY_COLOR)),
                      const SizedBox(height: 5),
                      OutlinedButton(
                          onPressed: () {},
                          child: Text("View Full Story", style: TextStyle(color: PRIMARY_COLOR, fontSize: 11)),
                          style: OutlinedButton.styleFrom(
                              backgroundColor: PRIMARY_COLOR.withOpacity(.1),
                              side: BorderSide(color: PRIMARY_COLOR, width: 1.2),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))))
                    ],
                  ),
                ),
              ),
              Flexible(

                  fit: FlexFit.tight, child: Image.asset("assets/mark.jpg", fit: BoxFit.cover)),
            ],
          )),
    );
  }

  ///second ListView shows the image in the card
  imageShowCaseListView() {
    return SizedBox(
        height: 70,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                      height: 70,
                      width: 70,
                      child: CacheNetworkImageWidget(
                          shouldUseBuilder: true, url: "https://cdn.pixabay.com/photo/2014/02/27/16/10/flowers-276014__340.jpg")));
            }));
  }

  ///Fundraiser Stories Card
  fundRaiserStoriesCard() {
    return IntrinsicHeight(
      child: Card(
          color: Colors.grey.shade200,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          // margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          clipBehavior: Clip.antiAlias,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(flex: 1, fit: FlexFit.tight, child: Image.asset("assets/mark.jpg", fit: BoxFit.cover)),
              Flexible(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Person name, country",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 14, color: PRIMARY_COLOR, fontWeight: FontWeight.w600)),
                      const Text("Tagline for raising funds",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black)),
                      const SizedBox(height: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                              width: 100,
                              child: OutlinedButton(
                                  onPressed: () {},
                                  child: const Text("Contribute",
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11)),
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: PRIMARY_COLOR,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))))),
                          SizedBox(
                            width: 100,
                            child: OutlinedButton(
                                onPressed: () {},
                                child: const Text("Share",
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11)),
                                style: OutlinedButton.styleFrom(
                                    backgroundColor: PRIMARY_COLOR,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}