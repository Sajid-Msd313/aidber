import 'package:aidber/screens/events/widgets/my_events_list.dart';
import 'package:aidber/utils/dimensions.dart';
import 'package:aidber/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../global_widgets/colors.dart';
import 'create_new_event/create_new_event_view.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        elevation: 0,
        title: const Text(
          'Events',
          style: TextStyle(color: Colors.white, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        actions: [
          Container(
              padding: const EdgeInsets.only(right: 10),
              alignment: Alignment.center,
              child: Image.asset(

                "assets/search.png",
                color: Colors.white,
                scale: 2.5,
              )),

          InkWell(
            onTap: () {
              Get.to(() => const CreateNewEvent(), transition: Transition.cupertinoDialog,
                  curve: Curves.ease,
                  duration: 400.milliseconds
              );
            },
            child: Container(
                padding: const EdgeInsets.only(right: 10),
                alignment: Alignment.center,
                child: const FaIcon(FontAwesomeIcons.circlePlus, color: Colors.white)),),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                const SizedBox(
                  height: 10,
                ),
                Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: Dimensions.PADDING_SIZE_LARGE, vertical: Dimensions.PADDING_SIZE_SMALL),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "My Events",
                      style: kstyle1.copyWith(fontSize: 17),
                    )),
                const MyEventsList(),
                Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: Dimensions.PADDING_SIZE_LARGE, vertical: Dimensions.PADDING_SIZE_SMALL),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Coming this week",
                      style: kstyle1.copyWith(fontSize: 17),
                    )),
                const MyEventsList(),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: Dimensions.PADDING_SIZE_LARGE, vertical: Dimensions.PADDING_SIZE_SMALL),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Top picks for you",
                      style: kstyle1.copyWith(fontSize: 17),
                    )),
                const MyEventsList()
              ],
            ),
          )),
    );
  }
}