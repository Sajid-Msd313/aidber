import 'package:aidber/global_widgets/cache_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

import '../../../global_widgets/colors.dart';
import '../../../models/fund_raiser/fund_raiser_model.dart';
import '../fund_raise_detail_screen.dart';

///Fundraiser Stories Card
class FundRaiserStoryCardTile extends StatelessWidget {
  SingleFundModel model;

  FundRaiserStoryCardTile({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: InkWell(
        onTap: ()=>Get.to( FundRaiserDetailScreen(id:model.id.toString())),
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
                    flex: 1,
                    fit: FlexFit.tight,
                    child: CacheNetworkImageWidget2(
                        placeHolder: Center(
                            child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor))),
                        url: model.fundRaiserImages!.isNotEmpty ? model.fundRaiserImages!.first.content : '')),
                // ) Image.asset("assets/mark.jpg", fit: BoxFit.cover)),
                Flexible(
                  flex: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(model.title ?? "",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 14, color: PRIMARY_COLOR, fontWeight: FontWeight.w600)),
                        Text(model.organisationName ?? "",
                            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black)),
                        const SizedBox(height: 5),
                        const _ProgressBarFundRaiserStory(),
                        const Text(
                          "Raised: \$ 3000",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
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
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class _ProgressBarFundRaiserStory extends StatelessWidget {
  const _ProgressBarFundRaiserStory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text("Target: \$ 3000", style: TextStyle(fontSize: 12, color: Colors.grey)),
        Container(
            decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(25)),
            child: const ProgressBar(
                value: 0.7,
                gradient:
                    LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Colors.green, Colors.greenAccent])))
      ],
    );
  }
}