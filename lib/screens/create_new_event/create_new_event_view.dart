

import 'package:aidber/global_widgets/appbar.dart';
import 'package:aidber/screens/create_new_event/widgets/body.dart';
import 'package:aidber/screens/create_new_event/widgets/header.dart';
import 'package:flutter/material.dart';

class CreateNewEvent extends StatelessWidget {
  const CreateNewEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar1,
      body:SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
            headerCreateEvent(),
            BodyNewCreateEvent()
          ],
        ),
      )),
    );
  }
}
