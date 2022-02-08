import 'package:aidber/global_widgets/appbar.dart';
import 'package:aidber/screens/events/widgets/my_events_list.dart';
import 'package:flutter/material.dart';


class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar,
      body: SafeArea(child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: const [
              Icon(Icons.arrow_back),
                    Text('Events'),
            ],),
                  Row(children: const [
                    Icon(Icons.search),
                    Icon(Icons.add),
                  ],)
                ],
              ),
              const SizedBox(height: 10,),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("My Events")),
              const MyEventsList(),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Coming this week")),
              const MyEventsList(),
              const SizedBox(height: 10,),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Top picks for you")),
              const MyEventsList(),
            ],
          ),
        ),
      )),
    );
  }
}
