import 'package:get/get.dart';

import '../../../models/posts/all_posts_model.dart';

class home_controller extends GetxController{

  var isLiked = false.obs;
  var isSaved = false.obs;


  toggle_like(){
    isLiked.value = ! isLiked.value;
    update();
  }
  toggle_save(){
    isSaved.value = ! isSaved.value;
    update();
  }


}