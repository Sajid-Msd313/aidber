import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class constans {

  static const String GOOGLE_API_KEY = "AIzaSyAjfITB9U_n7TWqVQLRZunTQb0NZetwzoc";
  static const String STORAGE_NAME = "user";
  static const String DEFAULT_IMAGE = "https://eecs.ceas.uc.edu/DDEL/images/default_display_picture.png/@@download/image/default_display_picture.png";
  static const String NO_INTERNET_CONNECTION = "Please check your internet connection";
}


class reactions {
  static Reaction heart =  Reaction<String>(
    value: '1',
    title: const Text(
      "Heart",
      style: TextStyle(color: Colors.red),
    ),
    previewIcon: const FaIcon(
      FontAwesomeIcons.solidHeart,
      color: Colors.red,
    ),
    icon: const FaIcon(
      FontAwesomeIcons.solidHeart,
      color: Colors.red,
    ),
  );
  static  Reaction good_luck = Reaction<String>(
  value: '2',
  title: const Text(
  "Good Luck",
  style: TextStyle(color: Colors.deepPurpleAccent),
  ),
  previewIcon: const FaIcon(
  FontAwesomeIcons.clover,
  color: Colors.deepPurpleAccent,
  ),
  icon: const FaIcon(
  FontAwesomeIcons.clover,
  color: Colors.deepPurpleAccent,
  ),
  );
  static  Reaction get_well_soon = Reaction<String>(
    value: '3',
    title:
    const Text("Get Well Soon", style: TextStyle(color: Colors.red)),
    previewIcon: const FaIcon(
      FontAwesomeIcons.appleWhole,
      color: Colors.red,
    ),
    icon: const FaIcon(
      FontAwesomeIcons.appleWhole,
      color: Colors.red,
    ),
  );
  static  Reaction clapping = Reaction<String>(
    value: '4',
    title:
    Text("Clapping", style: TextStyle(color: Colors.yellow.shade700)),
    previewIcon: FaIcon(
      FontAwesomeIcons.handsClapping,
      color: Colors.yellow.shade700,
    ),
    icon: FaIcon(FontAwesomeIcons.handsClapping,
        color: Colors.yellow.shade700),
  );
  static  Reaction happy = Reaction<String>(
    value: '5',
    title: Text("Happy", style: TextStyle(color: Colors.yellow.shade700)),
    previewIcon: FaIcon(
      FontAwesomeIcons.faceSmileBeam,
      color: Colors.yellow.shade700,
    ),
    icon: FaIcon(FontAwesomeIcons.faceSmileBeam,
        color: Colors.yellow.shade700),
  );
  static  Reaction initialHeart =  Reaction<String>(
    value: '1',
    title: const Text(
      "Heart",
      style: TextStyle(color: Colors.red),
    ),
    previewIcon: const FaIcon(
      FontAwesomeIcons.solidHeart,
      color: Colors.red,
    ),
    icon: const FaIcon(
      FontAwesomeIcons.heart,
    ),
  );


  static getReactionByValue(int reactionId){
    switch(reactionId){
      case 1 : return heart;
      case 2: return good_luck;
      case 3: return get_well_soon;
      case 4: return clapping;
      case 5: return happy;
      default: return  initialHeart;
    }
  }
}
