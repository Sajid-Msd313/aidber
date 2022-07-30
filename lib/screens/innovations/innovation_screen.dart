import 'package:aidber/screens/innovations/widgets/innovation_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/colors.dart';
import 'add_innovation_screen.dart';
import 'controller/AddInnovationController.dart';
import 'controller/InnovationMainController.dart';

class InnovationMainScreen extends GetView<InnovationMainController> {
  const InnovationMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        elevation: 0,
        title: const Text('Innovations', style: TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.center),
        actions: [
          IconButton(icon: Image.asset('assets/search.png', height: 30), onPressed: () {}),
          IconButton(
              onPressed: () =>
                  {Get.to(const AddInnovationScreen(), transition: Transition.rightToLeftWithFade, binding: AddInnovationBinding())},
              icon: const Icon(Icons.add, size: 30))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Recent", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: GetBuilder<InnovationMainController>(
                      builder: (controller) {
                        if(controller.isLoading){
                          return const Center(child: CircularProgressIndicator(),);
                        }
                        if(controller.innovationList.isEmpty){
                          return const Center(child: Text("No Innovations yet\n\nAdd Innovation By Clicking +", textAlign:
                          TextAlign.center,));
                        }
                        return  ListView.separated(
                            padding: const EdgeInsets.only(top: 10),
                            separatorBuilder: (_, __) => Divider(thickness: 2, color: Colors.grey.shade100),
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.innovationList.length,
                            itemBuilder: (BuildContext context, index) =>  InnovationItemTile(model:  controller.innovationList[index],));
                      }
                    )))
          ],
        ),
      ),
    );
  }
}