import 'package:flutter/material.dart';
import 'package:get/get.dart';

class topic_list extends StatelessWidget {
  int itemcount;
  double height;

  topic_list({required this.itemcount, required this.height});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: itemcount,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: Get.height*0.24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black12,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            "What causes a corona virus to change to a new variant",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Icon(Icons.more_vert,color: Colors.black45,size: 40,)
                      ],
                    ),

                  ],
                ),
              ),
              Container(
                color: Colors.black12,
                height: height,

              )
            ],
          );
        });
  }
}
