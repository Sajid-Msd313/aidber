import 'package:aidber/screens/innovations/widgets/innovation_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../global_widgets/colors.dart';

class InnovationMainScreen extends StatelessWidget {
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
          IconButton(onPressed: () => {}, icon: const Icon(Icons.add, size: 30))
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
              child: ListView.separated(
                  padding: const EdgeInsets.only(top: 10),
                  separatorBuilder: (_, __) => Divider(thickness: 2, color: Colors.grey.shade100),
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, index) => const InnovationItem()),
            ))
          ],
        ),
      ),
    );
  }
}