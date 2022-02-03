import 'package:flutter/material.dart';

class headerCreateEvent extends StatelessWidget {
  const headerCreateEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.arrow_back),
              Text('Edit Profile'),
            ],
          ),
        ),
        Container(

          height: 200,
          color: Colors.black12,
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.camera_alt,
                  size: 40,
                ),
                SizedBox(height: 10,),
                Text("Upload event cover")
              ],
            ),
          ),
        )
      ],
    );
  }
}
