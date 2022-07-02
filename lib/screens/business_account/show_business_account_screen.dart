import 'package:aidber/screens/business_account/controllers/business_mainController.dart';
import 'package:aidber/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/appbar.dart';

class show_business_accountScreen extends GetView<business_mainController> {
  const show_business_accountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Business Account",
        actions: [
          IconButton(
            tooltip: "Create Business Account",
            onPressed: () => {},
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (_, index) => const businessAccountItem()),
    );
  }
}

class businessAccountItem extends StatelessWidget {
  const businessAccountItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => {},
      leading: ClipRRect(
          child: Container(
        height: 50,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.network(constans.DEFAULT_IMAGE),
      )),
      title: const Text(
        "Healthcare Lounge",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: const Text(
        "76 Communitys | Category name",
        style: TextStyle(fontSize: 12),
      ),
      trailing: IconButton(
          tooltip: "More",
          padding: EdgeInsets.zero,
          icon: const Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          onPressed: () {}),
    );
  }
}
