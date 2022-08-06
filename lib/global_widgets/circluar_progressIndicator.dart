import 'package:aidber/global_widgets/colors.dart';
import 'package:flutter/material.dart';
class circular_progressIndicator extends StatelessWidget {
  const circular_progressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(
      color: PRIMARY_COLOR,
    ),);
  }
}