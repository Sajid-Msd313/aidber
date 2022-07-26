import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class CacheNetworkImageWidget extends StatelessWidget {
  final String? url;
  final Widget? placeHolder;
  final Widget? errorWidget;
  const CacheNetworkImageWidget({Key? key,  this.url, this.errorWidget, this.placeHolder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:  url??"",
      placeholder: (context, url) =>placeHolder?? const CircularProgressIndicator(),
      errorWidget: (context, url, error) =>errorWidget?? const Icon(Icons.error),
    );
  }
}