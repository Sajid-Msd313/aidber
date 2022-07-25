import 'package:aidber/global_widgets/appbar.dart';
import 'package:aidber/screens/events/create_new_event/widgets/body.dart';
import 'package:aidber/screens/events/create_new_event/widgets/header.dart';
import 'package:flutter/material.dart';

import '../../../global_widgets/colors.dart';

class CreateNewEvent extends StatelessWidget {
  const CreateNewEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        elevation: 0,
        title:const Text(
          'Create New Event',
          style: TextStyle(color: Colors.white, fontSize: 20),
          textAlign: TextAlign.center,
        ) ,

      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children:  [
           const headerCreateEvent(),
            BodyNewCreateEvent(),
          ],
        ),
      )),
    );
  }
}