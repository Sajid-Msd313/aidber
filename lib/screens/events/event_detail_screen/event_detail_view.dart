import 'package:aidber/global_widgets/appbar.dart';
import 'package:aidber/global_widgets/cache_network_image.dart';
import 'package:aidber/models/event/event_model.dart';
import 'package:aidber/screens/events/event_detail_screen/widgets/body.dart';
import 'package:flutter/material.dart';

class EventDetailView extends StatelessWidget {
  final Event eventModel;

  const EventDetailView({Key? key, required this.eventModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  child:const CacheNetworkImageWidget2(
                    shouldUseBuilder: true,
                    shouldHaveRadius:false,
                    url: "https://cdn.pixabay.com/photo/2014/02/27/16/10/flowers-276014__340.jpg",
                    placeHolder:  CircularProgressIndicator(),
                    errorWidget:  Icon(Icons.error),
                    //shouldUseBuilder: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            EventDetailBody(
              eventModel: eventModel,
            )
          ],
        ),
      )),
    );
  }
}