import 'package:aidber/controllers/storage_controller/storage_controller.dart';
import 'package:aidber/global_widgets/colors.dart';
import 'package:aidber/global_widgets/custom_button.dart';
import 'package:aidber/screens/business_account/controllers/business_mainController.dart';
import 'package:aidber/screens/business_account/controllers/create_business_controller.dart';
import 'package:aidber/screens/business_account/create_business_account_screen.dart';
import 'package:aidber/screens/business_account/show_business_account_screen.dart';
import 'package:aidber/screens/events/events_view.dart';
import 'package:aidber/screens/fund_raiser/controllers/fund_raiser_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../fund_raiser/fund_raiser_mainscreen.dart';
import '../../innovations/controller/InnovationMainController.dart';
import '../../innovations/innovation_screen.dart';

class bodymenu extends StatelessWidget {
  const bodymenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(children: [
        RichText(
            text: const TextSpan(text: "About: ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey), children: [
          TextSpan(
              text:
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat",
              style: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey))
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
                  decoration: BoxDecoration(color: PRIMARY_COLOR, borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(5),
                  // margin: EdgeInsets.symmetric(vertical: 5,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text("Healthcare Lounge",
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
                  Get.to(() => const EventsScreen());
                },
                child: Container(
                    decoration: BoxDecoration(color: PRIMARY_COLOR, borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(5),
                    // margin: EdgeInsets.symmetric(vertical: 5, ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Events", style: TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.center),
                        Image.asset(
                          "assets/events.png",
                          scale: 4,
                        )
                      ],
                    )),
              ),
              InkWell(
                onTap: (){
                  Get.to(() => const FundRaiserMainScreen(),binding: FundRaiserBindings());
                },
                child: Container(
                    decoration: BoxDecoration(color: PRIMARY_COLOR, borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(5),
                    // margin: EdgeInsets.symmetric(vertical: 5,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Fund Raiser", style: TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.center),
                        Image.asset(
                          "assets/career.png",
                          scale: 4,
                        )
                      ],
                    )),
              ),
              InkWell(
                onTap: () => Get.to(const InnovationMainScreen(), binding: InnovationMainBinding()),
                child: Container(
                    decoration: BoxDecoration(color: PRIMARY_COLOR, borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(5),
                    // margin: EdgeInsets.symmetric(vertical: 5, ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Innovation", style: TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.center),
                        Image.asset(
                          "assets/advancements.png",
                          scale: 4,
                        )
                      ],
                    )),
              ),
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
                binding: BindingsBuilder(() => {Get.put(create_business_controller())}),
                //   binding: BindingsBuilder(()=>Get.put(create_business_controller()))
              );
            }),
        const SizedBox(
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
        const SizedBox(
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