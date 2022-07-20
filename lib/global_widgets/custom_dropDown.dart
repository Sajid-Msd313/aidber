import 'package:flutter/material.dart';


class CustomDropDownPopup extends StatelessWidget {
  final List<String> dropDownList;
  final IconData iconData;
  final Color iconColor;
  final void Function(int) onSelected;
  final bool isIconCenter;

  const CustomDropDownPopup({
    required this.dropDownList,
    required this.onSelected,
    this.iconData = Icons.more_vert,
    this.isIconCenter = false,
    this.iconColor = Colors.black,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (context) => dropDownList
          .map((value) => PopupMenuItem(
        value: dropDownList.indexOf(value),
        child: Text(
          value,
          style: TextStyle(color: Colors.black,fontSize: 14),
        ),
      ))
          .toList(),
      initialValue: -1,
      onCanceled: () {
        print("You have canceled the menu.");
      },
      onSelected: onSelected,
      icon: Align(
          alignment: isIconCenter?Alignment.topCenter : Alignment.center
          ,child: Icon(iconData, size: 20, color: iconColor)),
    );
  }
}