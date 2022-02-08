import 'package:aidber/global_widgets/appbar.dart';
import 'package:aidber/global_widgets/custom_button.dart';
import 'package:flutter/material.dart';

class EventDetailView extends StatelessWidget {
  const EventDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar,
      body: SafeArea(
          child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/crazy.jpg',
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              Positioned(top: 10,left: 5,
                  child: Icon(Icons.arrow_back,color: Colors.white,))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
             Expanded(
               child: Row(children: [
                 Expanded(child: CustomdetailButton(btnText: 'Invite Friends', primary: true, onPressed: (){})),
                 SizedBox(width: 10,),
                 Expanded(child: CustomdetailButton(btnText: 'Going', primary: true, onPressed: (){})),
                 SizedBox(width: 10,),
               ],),
             ),
              Image.asset('assets/share.png',height: MediaQuery.of(context).size.height*0.04,),
                const SizedBox(width: 10,),
              Image.asset('assets/save.png',height: MediaQuery.of(context).size.height*0.04,),
            ],),
          )
        ],
      )),
    );
  }
}
