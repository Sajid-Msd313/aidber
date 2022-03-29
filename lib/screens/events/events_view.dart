import 'package:aidber/global_widgets/appbar.dart';
import 'package:aidber/screens/create_new_event/create_new_event_view.dart';
import 'package:aidber/screens/events/widgets/my_events_list.dart';
import 'package:aidber/utils/dimensions.dart';
import 'package:aidber/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar1,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children:  [
                      InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: const Icon(Icons.arrow_back_ios,)),
                       Text('Events',style: kstyle1.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,fontWeight: FontWeight.w800),),
                    ],
                  ),
                  Row(
                    children:  [
                      Image.asset("assets/search.png", color: primaryColor,scale: 2.5,),
                      InkWell(
                          onTap: (){
                            Get.to(()=> const CreateNewEvent(), transition: Transition.downToUp);
                          },
                          child: const Icon(Icons.add_circle,size: 32,color: primaryColor,)),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
               Container(
                  margin: const EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  alignment: Alignment.centerLeft, child: Text("My Events",style:kstyle1.copyWith(fontSize: 17),)),
              const MyEventsList(),
               Container(
                   margin: const EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  alignment: Alignment.centerLeft,
                  child: Text("Coming this week",style:kstyle1.copyWith(fontSize: 17),)),
              const MyEventsList(),
              const SizedBox(
                height: 10,
              ),
               Container(
                   margin: const EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  alignment: Alignment.centerLeft,
                  child: Text("Top picks for you",style:kstyle1.copyWith(fontSize: 17),)),
              Container(
                height: 300,
                child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    //physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                  return  MyEventsList();
                }),
              )
            ],
          ),
        ),
      )),
    );
  }
}
