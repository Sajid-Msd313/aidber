import 'package:flutter/material.dart';
import 'package:get/get.dart';
class make_single_network_card extends StatelessWidget {
  const make_single_network_card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: Get.width*.45,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(horizontal: 5),
      //shadowColor: Colors.black,
      decoration: BoxDecoration(

          border: Border.all(
            color: Colors.grey.shade300, //                   <--- border color
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
      ),
      child: Column(
        children: [
          Container(

              height:80,
              clipBehavior: Clip.hardEdge,
              width: 80,
              decoration:BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ) ,
              child: Image.asset('assets/mark.jpg', fit: BoxFit.cover,)),
          Text('Sajid Heal', style: TextStyle(fontWeight: FontWeight.bold),),
          Text('CEO at FoundHEAL'),
          Text('Toronto, Wazirstan'),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            width: Get.width*.35,
            child: FittedBox(
              child: FlatButton(
                child: const Text(
                  'Request to follow',
                  style: TextStyle(fontSize: 14),
                ),
                color: const Color(0xFF282d6b),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}