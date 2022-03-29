import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/dimensions.dart';
import '../../../utils/styles.dart';

class headerCreateEvent extends StatelessWidget {
  const headerCreateEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child:   Row(
            children:  [
              InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back_ios,)),
              Text('Edit Profile',style: kstyle1.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,fontWeight: FontWeight.w800),),
            ],
          ),
        ),
        Container(

          height: 200,
          color: Colors.black12,
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.camera_alt,
                  size: 40,
                ),
                SizedBox(height: 10,),
                Text("Upload event cover")
              ],
            ),
          ),
        )
      ],
    );
  }
}
