import 'package:aidber/screens/network/widget/make_single_network_card.dart';
import 'package:aidber/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/make_network_search_field.dart';

class Network_Screen extends StatelessWidget {
  const Network_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List data = [];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF282d6b),
          title: Text(
            'Found Heal',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Network',
                    style: kstyle1.copyWith(fontSize: 20,fontWeight: FontWeight.w800),

                  )),
            ),
            SizedBox(
              height: 15,
            ),

            make_network_search_field(),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Most Followed people',
                    style: kstyle1.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                  )),
            ),

           Container(
             height: Get.height*.3,
             margin: EdgeInsets.all(10),
             child: ListView.builder(
               itemCount: 5,
               scrollDirection: Axis.horizontal,
                 shrinkWrap: true,
                 itemBuilder: (context, index){


             return   const make_single_network_card();
           }),)
          ]
          ),
        )
    );
  }
}