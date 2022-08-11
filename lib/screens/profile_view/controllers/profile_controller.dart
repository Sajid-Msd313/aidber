import 'package:aidber/data/services/my_profile/my_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/my_profile/my_profile_model.dart';
import '../../../models/posts/all_posts_model.dart' as posts;

class profile_controller extends GetxController {
  MyProfileModel myProfileModel = MyProfileModel();
  List<posts.Posts> postList = [];
  bool _isLoading = false;

  final scrollController = ScrollController();
  @override
  onInit(){
    fetchMyProfile();
    super.onInit();
  }
  fetchMyProfile() async {
    isLoading = true;
    var detail = await myProfile_services.fetch_myProfile_services();
    if (detail is MyProfileModel) {
      myProfileModel = detail;
      postList = detail.data!.posts?? [];
    }
    isLoading = false;
  }

  updateLocallyData(User? user) {
    myProfileModel.data = user;
    isLoading = false;
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }
}