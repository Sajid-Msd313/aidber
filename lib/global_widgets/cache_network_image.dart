import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class CacheNetworkImageWidget extends StatelessWidget {
  final String? url;
  final Widget? placeHolder;
  final Widget? errorWidget;
  final bool shouldUseBuilder;

  const CacheNetworkImageWidget({Key? key,  this.url, this.errorWidget, this.placeHolder, this.shouldUseBuilder = false}) : super(key:
  key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:  url??"",
      imageBuilder:shouldUseBuilder? (context, imageProvider) => Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ) : null,
      placeholder: (context, url) =>placeHolder?? const CircularProgressIndicator(),
      errorWidget: (context, url, error) =>errorWidget?? const Icon(Icons.error),
    );
  }
}