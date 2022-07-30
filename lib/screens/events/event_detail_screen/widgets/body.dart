import 'package:aidber/global_widgets/colors.dart';
import 'package:aidber/global_widgets/custom_button.dart';
import 'package:aidber/models/event/event_model.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../utils/utils.dart';

class EventDetailBody extends StatelessWidget {
  final Event eventModel;

  const EventDetailBody({Key? key, required this.eventModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: CustomdetailButton(btnText: 'Invite Friends', primary: true, onPressed: () {})),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(child: CustomdetailButton(btnText: 'Going', primary: true, onPressed: () {})),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              Image.asset(
                'assets/share.png',
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/save.png',
                height: MediaQuery.of(context).size.height * 0.04,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            eventModel.title ?? "",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: PRIMARY_COLOR),
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${Jiffy(eventModel.date).format("dd MMM yyyy")}  |  ${hisFroamteToReadableTimeFormate(eventModel.time)}",
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const Text(
                "86 going",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.location_on),
              Text(
                eventModel.location ?? "",
                style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          RichText(
              text: TextSpan(
                  text: "Organized by: ",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                TextSpan(
                  text: eventModel.organisedBy ?? "",
                  style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
                )
              ])),
          const SizedBox(
            height: 10,
          ),
          RichText(
              text: TextSpan(
                  text: "Description: ",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                TextSpan(
                  text:eventModel.description?? "",
                  style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
                )
              ])),
          const SizedBox(
            height: 10,
          ),
          RichText(
              text: TextSpan(
                  text: "What to expect: ",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                TextSpan(
                  text: eventModel.whatToExpect??"",
                  style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
                )
              ])),
        ],
      ),
    );
  }
}