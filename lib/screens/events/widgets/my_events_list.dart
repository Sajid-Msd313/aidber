import 'package:aidber/global_widgets/colors.dart';
import 'package:aidber/screens/event_detail_screen/event_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyEventsList extends StatelessWidget {
  const MyEventsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const EventDetailView());
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) => Container(
            margin: const EdgeInsets.all(5),
            // height: 200,
            width: Get.width * 0.92,
            //height: MediaQuery.of(context).size.height*0.43,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 2)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    child: Image.asset(
                      'assets/sajidmsd.jpg',
                      // scale: 4,
                      height: Get.height*.3,
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Women's Day Expo",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text("22 March,2022",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black)),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: const [
                              Icon(Icons.location_on),
                              Text("Lorem ipsum dolor",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black)),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          RichText(
                              textAlign: TextAlign.justify,
                              text: const TextSpan(
                                  text: "Description:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text:
                                            "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black))
                                  ])),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text("86 going",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey)),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text("Going"),
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    onPrimary: Colors.white,
                                    primary: PRIMARY_COLOR),
                              ),
                              Image.asset(
                                'assets/share.png',
                                scale: 7,
                              ),
                              Image.asset(
                                'assets/save.png',
                                scale: 7,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//
