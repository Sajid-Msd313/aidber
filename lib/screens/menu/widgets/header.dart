import 'package:flutter/material.dart';

class headerMenu extends StatelessWidget {
  const headerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10), // Image border
            child: SizedBox.fromSize(
              size: const Size.fromRadius(30), // Image radius
              child: Image.asset('assets/sajidmsd.jpg', fit: BoxFit.cover),
            ),
          ),
          title: const Text("Sajid"),
          subtitle: const Text("View Profile"),
        ),
      ],
    );
  }
}
