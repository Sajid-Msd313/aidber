import 'package:aidber/global_widgets/colors.dart';
import 'package:aidber/screens/hot_topics/widgets/topic_list.dart';
import 'package:flutter/material.dart';



class hot_topics extends StatelessWidget {
  const hot_topics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_sharp,color: Colors.white,),
        title: Text("Hot Topics"),
        backgroundColor: PRIMARY_COLOR,
        actions: [ IconButton(
          icon: Image.asset('assets/search.png',height:30,width:40,),
          onPressed: () {},
        ),],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            topic_list(itemcount: 5,height: 3,)
          ],
        ),
      ),
    );
  }
}
