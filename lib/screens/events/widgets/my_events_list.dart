import 'package:aidber/screens/events/controllers/event_controller.dart';
import 'package:aidber/screens/events/widgets/single_event_widget.dart';
import 'package:aidber/screens/events/widgets/upcomming_event_list.dart';
import 'package:aidber/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../event_detail_screen/event_detail_view.dart';

class MyEventsList extends StatelessWidget {
  const MyEventsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: GetBuilder<EventController>(
        init: EventController(),
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (controller.myEventList.isEmpty) {
            return const Center(
              child: Text('There are no events yet.'),
            );
          }
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
            scrollDirection: Axis.horizontal,
            itemCount: controller.myEventList.length,
            itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () => Get.to(
                    () => EventDetailView(
                          eventModel: controller.myEventList[index],
                        ),
                    transition: Transition.topLevel),
                child: SingleEventWidget(
                  model: controller.myEventList[index],
                  onShareCallBack: () => controller.shareEvent(eventId: controller.myEventList[index].id.toString()),
                  onAttendCallBack: () => controller.attendEventById(eventId: controller.myEventList[index].id.toString()),
                )),
          );
        },
      ),
    );
  }
}


//