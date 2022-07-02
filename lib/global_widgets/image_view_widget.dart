import 'dart:io';

import 'package:aidber/utils/constants.dart';
import 'package:flutter/material.dart';

class image_view_widget extends StatelessWidget {
  final String? imageFilePath;
  final double? height;
  final  callBack;

  image_view_widget({this.imageFilePath, this.height, this.callBack});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
            child: ClipRRect(
                child: Container(
              height: height == null ? null : height! - 20,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: imageFilePath == null || imageFilePath.toString() == ""
                  ? Image.network(constans.DEFAULT_IMAGE)
                  : Image.file(File(imageFilePath.toString())),
            )),
          ),
      if(callBack != null)    Positioned(
              right: -2,
              top: -9,
              child: IconButton(
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.white.withOpacity(0.5),
                    size: 18,
                  ),
                  onPressed: callBack )),
        ],
      ),

/*      Stack(
        children: [

          Positioned(
            child: ClipRRect(
                child: Container(
height: height == null?null : height! - 20,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: imageFilePath == null || imageFilePath.toString() == ""
                  ? Image.asset(constans.DEFAULT_IMAGE)
                  : Image.file(File(imageFilePath.toString())),
            )),
          ),
          Positioned(
              top: -20,
              child: Icon(Icons.delete)),
        ],
      ),*/
    );
  }
}
