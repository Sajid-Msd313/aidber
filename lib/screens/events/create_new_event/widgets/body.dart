import 'package:aidber/global_widgets/custom_button.dart';
import 'package:aidber/global_widgets/text_fields.dart';
import 'package:aidber/screens/events/controllers/create_new_event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyNewCreateEvent extends StatelessWidget {
   BodyNewCreateEvent({Key? key}) : super(key: key);

  final controller  = Get.put(CreateNewEventController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateNewEventController>(
        init: CreateNewEventController(),
        builder: (controller) {

      return Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAuthTextFormField(
                labeltext: "Event Title",
                hint: 'Please Enter Your Name',
                controller: controller.titleC,
              ),
              const SizedBox(height: 10),
              CustomAuthTextFormField(
                hint: 'Organized By',
                labeltext: "Organized By",
                controller: controller.organizedByC,
              ),
              const SizedBox(height: 10),
              CustomAuthTextFormField(hint: 'Please Enter Your Venue', labeltext: "Venue", controller: controller.locationC),
              const SizedBox(height: 10),
              CustomAuthTextFormField(hint: 'Please Enter Date', labeltext: "Date", controller: controller.dateC),
              const SizedBox(height: 10),
              CustomAuthTextFormField(hint: 'Please Enter Time', labeltext: "Time", controller: controller.timeC),
              const SizedBox(height: 10),
              CustomMaxTextFormField(
                  hint: 'Please Enter a Description', labeltext: "Description", controller: controller.descriptionC),
              const SizedBox(height: 10),
              CustomMaxTextFormField(hint: 'Expectation', labeltext: "What to Expect", controller: controller.whatToExpectC),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: controller.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomButton(btnText: 'Create', primary: true, onPressed: () => controller.submit()),
              ),
            ],
          ),
        ),
      );
    });
  }
}