import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/error_image_builder.dart';

class CacheNetworkImageWidget extends StatelessWidget {
  final String? url;
  final Widget? placeHolder;
  final Widget? errorWidget;
  final bool shouldUseBuilder;
  final bool shouldHaveCenterProgressIndicator;

  const CacheNetworkImageWidget(
      {Key? key,
      this.url,
      this.errorWidget,
      this.placeHolder,
      this.shouldUseBuilder = false,
      this.shouldHaveCenterProgressIndicator = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url ?? "",
      imageBuilder: shouldUseBuilder
          ? (context, imageProvider) => Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              )
          : null,
      placeholder: (context, url) =>
          shouldHaveCenterProgressIndicator ? const CenterCircularProgressIndicat() : const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const ErrorImageBuilder(),
    );
  }
}

class CenterCircularProgressIndicat extends StatelessWidget {
  const CenterCircularProgressIndicat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class CacheNetworkImageWidget2 extends StatelessWidget {
  final String? url;
  final Widget? placeHolder;
  final Widget? errorWidget;
  final bool shouldUseBuilder;
  final bool shouldHaveRadius;

  const CacheNetworkImageWidget2(
      {Key? key, this.url, this.errorWidget, this.placeHolder, this.shouldUseBuilder = false, this.shouldHaveRadius = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url ?? "",
      imageBuilder: shouldUseBuilder
          ? (context, imageProvider) => Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: shouldHaveRadius ? BorderRadius.circular(15) : null,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              )
          : null,
      placeholder: (context, url) => Center(child: placeHolder ?? const CircularProgressIndicator()),
      errorWidget: (context, url, error) => errorWidget ?? const Icon(Icons.error),
    );
  }
}