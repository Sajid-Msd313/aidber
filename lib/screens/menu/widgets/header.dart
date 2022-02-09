import 'package:flutter/material.dart';
import 'package:get/get.dart';

class headerMenu extends StatelessWidget {
  const headerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
       ListTile(
        leading: InkWell( onTap: (){
          Get.back();
        },child: const Icon(Icons.arrow_back)),
        title: const Text('Menu'),
        trailing: const Icon(Icons.search),
      ),
      ListTile(leading:  ClipRRect(
        borderRadius: BorderRadius.circular(10), // Image border
        child: SizedBox.fromSize(
          size: const Size.fromRadius(30), // Image radius
          child: Image.asset('assets/sajidmsd.jpg', fit: BoxFit.cover),
        ),
      ),
      title: const Text("Sajid"),
      subtitle: const Text("View Profile"),
      ),
    ],);
  }
}
