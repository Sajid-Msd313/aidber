import 'package:aidber/global_widgets/custom_button.dart';
import 'package:aidber/global_widgets/text_fields.dart';
import 'package:aidber/screens/events/controllers/create_new_event_controller.dart';
import 'package:aidber/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyNewCreateEvent extends StatelessWidget {
  BodyNewCreateEvent({Key? key}) : super(key: key);

  final controller = Get.put(CreateNewEventController());

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
                  InkWell(
                    onTap: ()=>controller.open_search_map(context),
                    child: AbsorbPointer(
                        absorbing: true,
                        child: CustomAuthTextFormField(hint: 'Please Enter Your Venue', labeltext: "Venue", controller: controller.locationC)),
                  ),
                  const SizedBox(height: 10),
                  //2022-02-24
                  InkWell(
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(const Duration(days: 30)))
                            .then((value) {
                          if (value != null) {
                            controller.dateC.text = convertToHISFormate(value);
                          }
                        });
                      },
                      child: CustomAuthTextFormField(
                          hint: 'Please Enter Date', labeltext: "Date", controller: controller.dateC, isEnable: false)),
                  const SizedBox(height: 10),
                  //H-i-s (02-35-02)
                  InkWell(
                      onTap: () {
                        showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) {
                          if (value != null) {
                            controller.viewtimeC.text = value.format(context);
                            controller.timeC.text = convertToHISFormateTime(value);
                          }
                        });
                      },
                      child: CustomAuthTextFormField(
                          hint: 'Please Enter Time', labeltext: "Time", controller:  controller.viewtimeC, isEnable: false)),
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
                        : CustomButton(btnText: 'Create', primary: true, onPressed: ()  {
                          FocusScope.of(context).unfocus();
                          controller.submit();
                    }),
                  ),
                ],
              ),
            ),
          );
        });
  }
}