import 'package:aidber/global_widgets/appbar.dart';
import 'package:aidber/global_widgets/custom_button.dart';
import 'package:aidber/screens/event_detail_screen/widgets/body.dart';
import 'package:flutter/material.dart';

class EventDetailView extends StatelessWidget {
  const EventDetailView({Key? key}) : super(key: key);

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
                Image.asset(
                  'assets/crazy.jpg',
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                Positioned(top: 10,left: 5,
                    child: Icon(Icons.arrow_back,color: Colors.white,))
              ],
            ),
            EventDetailBody()
        ],
      ),
          )),
    );
  }
}
