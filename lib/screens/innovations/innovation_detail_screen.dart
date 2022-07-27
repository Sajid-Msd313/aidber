import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InnovationDetailScreen extends StatelessWidget {
  const InnovationDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(height: MediaQuery.of(context).size.height * .3, color: Colors.green),
              const Positioned(top: 10, left: 0, child: BackButton()),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                const Text("Added By: Lorem Bhai", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: RichText(
                          text: const TextSpan(
                              text: 'Lorem ipsum dolor sit amet, consectetuer adipiscing eliasdsad asd as ',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                              children: [
                            TextSpan(
                                text: " BreakThrough News",
                                style: TextStyle(
                                    fontSize: 11.5, fontStyle: FontStyle.italic, color: Colors.grey, fontWeight: FontWeight.w400))
                          ])),
                    ),
                    Row(
                      children: [
                        IconButton(
                            padding: EdgeInsets.zero,
                            visualDensity: const VisualDensity(horizontal: -4, vertical: -3),
                            onPressed: () => {},
                            splashRadius: 20,
                            icon: const FaIcon(FontAwesomeIcons.share, color: Colors.grey, size: 15)),
                        IconButton(
                            padding: EdgeInsets.zero,
                            visualDensity: const VisualDensity(horizontal: -4, vertical: -3),
                            onPressed: () => {},
                            splashRadius: 20,
                            icon: const FaIcon(FontAwesomeIcons.bookmark, color: Colors.grey, size: 15)),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 24),
                const Text("www.lorem-ipsim.com"),
                const SizedBox(height: 24),
                RichText(
                    text: const TextSpan(
                        text: 'Description:\n',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                        children: [
                      TextSpan(
                          text:
                              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat",
                          style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400))
                    ])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}