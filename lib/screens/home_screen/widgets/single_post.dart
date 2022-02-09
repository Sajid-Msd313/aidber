import 'package:flutter/material.dart';
class single_post extends StatelessWidget {
  const single_post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
            subtitle:  const Text(
              'And Most Importantly,take good care of yourself first:of your body,mind, and soul!',),
            trailing: const Icon(Icons.more_vert_sharp),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            height: MediaQuery.of(context).size.height * 0.3,
            // width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                    image: AssetImage("assets/crazy.jpg"))),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
