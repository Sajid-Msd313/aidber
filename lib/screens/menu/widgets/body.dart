import 'package:aidber/global_widgets/colors.dart';
import 'package:aidber/global_widgets/custom_button.dart';
import 'package:flutter/material.dart';

class bodymenu extends StatelessWidget {
  const bodymenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Column(children: [
        RichText(
            text: TextSpan(
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
        SizedBox(height: 10,),
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
                  padding: EdgeInsets.all(5),
                  // margin: EdgeInsets.symmetric(vertical: 5,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Doctor's Lounge",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                          textAlign: TextAlign.center),
                      Image.asset(
                        "assets/advancements.png",
                        scale: 4,
                      )
                    ],
                  )),
              Container(
                  decoration: BoxDecoration(
                      color: PRIMARY_COLOR,
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(5),
                  // margin: EdgeInsets.symmetric(vertical: 5, ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Events",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                          textAlign: TextAlign.center),
                      Image.asset(
                        "assets/events.png",
                        scale: 4,
                      )
                    ],
                  )),
              Container(
                  decoration: BoxDecoration(
                      color: PRIMARY_COLOR,
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(5),
                  // margin: EdgeInsets.symmetric(vertical: 5,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Career",
                          style: TextStyle(fontSize: 16, color: Colors.white),
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
                  padding: EdgeInsets.all(5),
                  // margin: EdgeInsets.symmetric(vertical: 5, ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Advancements",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                          textAlign: TextAlign.center),
                      Image.asset(
                        "assets/advancements.png",
                        scale: 4,
                      )
                    ],
                  )),
            ]),
        SizedBox(
          height: 10,
        ),
        CustomLogOutButton(btnText: "Log Out", primary: true, onPressed: () {})
      ]),
    );
  }
}
