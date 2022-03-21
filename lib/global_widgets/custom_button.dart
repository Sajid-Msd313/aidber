import 'package:flutter/material.dart';

import 'colors.dart';

//Custom button
class CustomButton extends StatelessWidget {
  final String btnText;
  final bool primary;
  final bool showShadow;

  final VoidCallback? onPressed;

  const CustomButton(
      {Key? key,
        this.showShadow = true,
        required this.btnText,
        required this.primary,
        required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 49,
        width: double.infinity,

        // margin: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
        decoration: BoxDecoration(
            boxShadow:  [
              BoxShadow(
                color: PRIMARY_COLOR,
                blurRadius:showShadow? 4 : 0,
                offset: Offset(1, 1), // Shadow position
              ),
            ],
            border: Border.all(color: PRIMARY_COLOR),
            color: primary ? PRIMARY_COLOR : Colors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            btnText,
            // textAlign: TextAlign.center,
            style: TextStyle(
                color: primary ? Colors.white : PRIMARY_COLOR,
                fontSize: 16.8,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
//event detail screen button
class CustomdetailButton extends StatelessWidget {
  final String btnText;
  final bool primary;

  final VoidCallback? onPressed;

  const CustomdetailButton(
      {Key? key,
        required this.btnText,
        required this.primary,
        required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        //padding: EdgeInsets.symmetric(horizontal: 5),
        height: 40,
        width: double.infinity,

        // margin: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: PRIMARY_COLOR,
                blurRadius: 4,
                offset: Offset(1, 1), // Shadow position
              ),
            ],
            border: Border.all(color: PRIMARY_COLOR),
            color: primary ? PRIMARY_COLOR : Colors.white,
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(
            btnText,
            // textAlign: TextAlign.center,
            style: TextStyle(
                color: primary ? Colors.white : PRIMARY_COLOR,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
//For log out


class CustomLogOutButton extends StatelessWidget {
  final String btnText;
  final bool primary;

  final VoidCallback? onPressed;

  const CustomLogOutButton(
      {Key? key,
        required this.btnText,
        required this.primary,
        required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 49,
        width: double.infinity,

        // margin: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: PRIMARY_COLOR,
                blurRadius: 4,
                offset: Offset(1, 1), // Shadow position
              ),
            ],
            border: Border.all(color: PRIMARY_COLOR),
            color: primary ? PRIMARY_COLOR : Colors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              btnText,
              // textAlign: TextAlign.center,
              style: TextStyle(
                  color: primary ? Colors.white : PRIMARY_COLOR,
                  fontSize: 16.8,
                  fontWeight: FontWeight.w700),
            ),
            Image.asset('assets/signout.png',scale: 4)
          ],
        ),
      ),
    );
  }
}

//menu button
class CustomLogMenuButton extends StatelessWidget {
  final String btnText;
  final bool primary;

  final VoidCallback? onPressed;

  const CustomLogMenuButton(
      {Key? key,
        required this.btnText,
        required this.primary,
        required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 49,
        width: double.infinity,

        // margin: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: PRIMARY_COLOR,
                blurRadius: 4,
                offset: Offset(1, 1), // Shadow position
              ),
            ],
            border: Border.all(color: PRIMARY_COLOR),
            color: primary ? PRIMARY_COLOR : Colors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          btnText,
          // textAlign: TextAlign.center,
          style: TextStyle(
              color: primary ? Colors.white : PRIMARY_COLOR,
              fontSize: 16.8,
              fontWeight: FontWeight.w700),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}