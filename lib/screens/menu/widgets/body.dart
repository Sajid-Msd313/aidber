import 'package:aidber/controllers/storage_controller/storage_controller.dart';
import 'package:aidber/global_widgets/colors.dart';
import 'package:aidber/global_widgets/custom_button.dart';
import 'package:aidber/screens/auth/login/login_view.dart';
import 'package:aidber/screens/business_account/controllers/business_mainController.dart';
import 'package:aidber/screens/business_account/controllers/create_business_controller.dart';
import 'package:aidber/screens/business_account/create_business_account_screen.dart';
import 'package:aidber/screens/business_account/show_business_account_screen.dart';
import 'package:aidber/screens/events/events_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/get_di.dart';

class bodymenu extends StatelessWidget {
  const bodymenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(children: [
        RichText(
            text: const TextSpan(
                text: "About:",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                children: [
              TextSpan(
                  text:
                      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat",
                  style: TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.grey))
            ])),
        const SizedBox(
          height: 10,
        ),
        GridView.count(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: (2 / 1),
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: PRIMARY_COLOR,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(5),
                  // margin: EdgeInsets.symmetric(vertical: 5,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: const Text("Healthcare Lounge",
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            textAlign: TextAlign.start),
                      ),
                      Image.asset(
                        "assets/doctor_lounge.png",
                        scale: 4,
                      )
                    ],
                  )),
              InkWell(
                onTap: () {
                  Get.to(() => EventsScreen());
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: PRIMARY_COLOR,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(5),
                    // margin: EdgeInsets.symmetric(vertical: 5, ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Events",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            textAlign: TextAlign.center),
                        Image.asset(
                          "assets/events.png",
                          scale: 4,
                        )
                      ],
                    )),
              ),
              Container(
                  decoration: BoxDecoration(
                      color: PRIMARY_COLOR,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(5),
                  // margin: EdgeInsets.symmetric(vertical: 5,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Find a Job's",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          textAlign: TextAlign.center),
                      Image.asset(
                        "assets/career.png",
                        scale: 4,
                      )
                    ],
                  )),
              Container(
                  decoration: BoxDecoration(
                      color: PRIMARY_COLOR,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(5),
                  // margin: EdgeInsets.symmetric(vertical: 5, ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Innovation",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          textAlign: TextAlign.center),
                      Image.asset(
                        "assets/advancements.png",
                        scale: 4,
                      )
                    ],
                  )),
            ]),
        const SizedBox(
          height: 10,
        ),
        CustomLogMenuButton(
            btnText: "Saved",
            primary: true,
            onPressed: () {
           //   Get.offAll(() => const Sign_In2());
            }),
        const SizedBox(
          height: 7,
        ),
        CustomLogMenuButton(
            btnText: "Create Business Account",
            primary: true,
            onPressed: () {
              Get.to(
                () => const create_business_accountview(),
                binding: BindingsBuilder(
                    () => {Get.put(create_business_controller())}),
                //   binding: BindingsBuilder(()=>Get.put(create_business_controller()))
              );
            }),
        SizedBox(
          height: 7,
        ),
        CustomLogMenuButton(
          btnText: "Business Accounts",
          primary: true,
          onPressed: () {
            Get.to(
              () => const show_business_accountScreen(),
              // binding: BindingsBuilder(()=>Get.put( business_mainController())),
              binding: BindingsBuilder(() => {Get.put(business_mainController())}),
            );
          },
        ),
        SizedBox(
          height: 7,
        ),
        CustomLogOutButton(
            btnText: "Log Out",
            primary: true,
            onPressed: () {
              Get.find<storage_controller>().clear_storage();
            })
      ]),
    );
  }
}