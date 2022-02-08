import 'package:aidber/global_widgets/appbar.dart';
import 'package:aidber/screens/home_screen/widgets/header.dart';
import 'package:aidber/screens/home_screen/widgets/posts_list.dart';
import 'package:flutter/material.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                  child: const HomeHeader()),
              const SizedBox(height: 10,),
              Divider(height: 2,
                thickness:6,color: Colors.grey.shade200,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PostsList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
