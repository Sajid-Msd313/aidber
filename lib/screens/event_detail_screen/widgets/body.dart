import 'package:aidber/global_widgets/colors.dart';
import 'package:aidber/global_widgets/custom_button.dart';
import 'package:flutter/material.dart';

class EventDetailBody extends StatelessWidget {
  const EventDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: CustomdetailButton(
                            btnText: 'Invite Friends',
                            primary: true,
                            onPressed: () {})),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: CustomdetailButton(
                            btnText: 'Going', primary: true, onPressed: () {})),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              Image.asset(
                'assets/share.png',
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/save.png',
                height: MediaQuery.of(context).size.height * 0.04,
              ),
            ],
          ),
          Text(
            "Women's Day Expo",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: PRIMARY_COLOR),
          ),
          SizedBox(height: 7,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "8 March,2022  |  6:00 PM",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                "86 going",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.location_on),
              Text(
                "Lorem ipsum dolor",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
          SizedBox(height: 7,),
          RichText(
              text: TextSpan(
                  text: "Organized by:",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                TextSpan(
                  text: "Lorem ipsum dolor",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                )
              ])),
          SizedBox(height: 10,),
          RichText(
              text: TextSpan(
                  text: "Discription:",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "\nLorem ipsum dolor sadar seb is good and working realy hard lorem ipsum"*4,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    )
                  ])),
          SizedBox(height: 10,),
          RichText(
              text: TextSpan(
                  text: "What to expect:",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "\nLorem ipsum dolor sLorem ipsum dolor sadar seb is good and working realy hard lorem ipsum"*4,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    )
                  ])),
        ],
      ),
    );
  }
}
