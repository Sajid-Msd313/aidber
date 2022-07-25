import 'package:aidber/global_widgets/colors.dart';
import 'package:aidber/models/event/event_model.dart';
import 'package:aidber/screens/events/controllers/event_controller.dart';
import 'package:aidber/utils/api_urls.dart';
import 'package:aidber/utils/dimensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../event_detail_screen/event_detail_view.dart';

class MyEventsList extends StatelessWidget {
  const MyEventsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const EventDetailView());
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: GetBuilder<EventController>(
          init: EventController(),
          builder: (controller){
            if(controller.isLoading){
              return const Center(child: CircularProgressIndicator(),);
            }
            if(controller.allEvents.isEmpty){
              return const Center(child: Text('There are no events yet.'),);
            }
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
              scrollDirection: Axis.horizontal,
              itemCount: controller.allEvents.length,
              itemBuilder: (BuildContext context, int index) =>SingleEventWidget(model:controller.allEvents[index] ,),
            );
          },
        ),
      ),
    );
  }
}

class SingleEventWidget extends StatelessWidget {
  final Event model;

 const SingleEventWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      // height: 200,
      width: Get.width * 0.85,
      //height: MediaQuery.of(context).size.height*0.43,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey, width: 2)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                child:CachedNetworkImage(
                  imageUrl: api_urls.BASE_URL_PUBLIC + model.image.toString(),
                  fit: BoxFit.fitHeight,
                  width: Get.width * 0.3,
                  height: Get.height * 0.3,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator(),),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(model.title ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(model.time ?? "", style: const TextStyle(fontWeight: FontWeight.normal, color: Colors.black)),
                    const SizedBox(
                      height: 5,
                    ),
                    RichText(
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(text: "", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black), children: [
                          const WidgetSpan(
                              child: Icon(
                                Icons.location_on,
                                size: 15,
                              ),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text: model.location == null
                                  ? ""
                                  : model.location!.length > 20
                                      ? model.location!.substring(0, 10) + '...'
                                      : model.location!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal, color: Colors.black, overflow: TextOverflow.ellipsis, fontSize: 13))
                        ])),

                    // Row(
                    //   children: const [
                    //     Icon(Icons.location_on),
                    //     Text("Lorem ipsum dolor", style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black)),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 5,
                    ),
                    FittedBox(
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                                text: "Description: ",
                                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                children: [
                                  TextSpan(
                                      text: model.description,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.normal, color: Colors.black, overflow: TextOverflow.ellipsis))
                                ])),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text("86 going", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.grey)),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Going"),
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                                onPrimary: Colors.white,
                                primary: PRIMARY_COLOR),
                          ),
                          Image.asset(
                            'assets/share.png',
                            scale: 8,
                          ),
                          Image.asset(
                            'assets/save.png',
                            scale: 8,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//