import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsList extends StatelessWidget {
  const PostsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height - Get.statusBarHeight,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) => Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,

              style: ListTileStyle.drawer,
              leading: ClipRRect(
                child: Image.asset('assets/sajidmsd.jpg'),
                borderRadius: BorderRadius.circular(10),
              ),
              title: RichText(
                text: const TextSpan(
                    text: "Username",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                          text: "           31s",
                          style: TextStyle(fontSize: 8, color: Colors.black38))
                    ]),
              ),
              subtitle: const Text(
                  'And Most Importantly,take good care of yourself first:of your body,mind, and soul!'),
            trailing: const Icon(Icons.more_vert_sharp),),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/crazy.jpg',
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
