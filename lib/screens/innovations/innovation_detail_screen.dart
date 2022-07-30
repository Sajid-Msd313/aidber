import 'package:aidber/global_widgets/cache_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../models/innovations/innovation_item_model.dart';

class InnovationDetailScreen extends StatelessWidget {
  final InnovationItemModel model;

  const InnovationDetailScreen({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * .3,
                  width: MediaQuery.of(context).size.width,
                  child: CacheNetworkImageWidget(
                      url: model.innovationImages?.isNotEmpty ?? false ? model.innovationImages?.first.content : "")),
              const Positioned(top: 0, left: 0, child: BackButton()),
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  const Text("Added By: Lorem Bhai", style:  TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: RichText(
                            text: TextSpan(
                                text: model.title,
                                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                                children: [
                              TextSpan(
                                  text: " ${model.category}",
                                  style: const TextStyle(
                                      fontSize: 11.5, fontStyle: FontStyle.italic, color: Colors.grey, fontWeight: FontWeight.w500))
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
                  if (model.link != null) Text(model.link!),
                  const SizedBox(height: 12),
                  RichText(
                      text: TextSpan(
                          text: 'Description:\n',
                          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                          children: [
                        TextSpan(
                            text: "${model.description} asda asdasdas dasd asd asd asd asd asd asdas das dasd asd asdasd asdasd asd "
                                "asda sd asd asd asdasd asdsdfdfgdfh fghfg hfghjdfg" *5,
                            style: const TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w500))
                      ])),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}