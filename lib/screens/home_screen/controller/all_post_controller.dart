import 'package:aidber/data/services/posts/post_services.dart';
import 'package:aidber/models/posts/all_posts_model.dart';
import 'package:aidber/models/posts/like_post_model.dart';
import 'package:aidber/utils/utils.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../data/api.dart';

class all_post_controller extends GetxController with SinglePostApis {
  ApiClient apiClient;

  all_post_controller({required this.apiClient});

  @override
  onInit() {
    super.onInit();
    fetch_allPosts();
  }

  bool _isLoading = false;
  GetAllPost _getAllPost = GetAllPost();

  reactAPost({required String postId, required String reactionType}) async {
    var detail = await post_services.like_post(
        client: apiClient, post_id: postId, type: reactionType);
    if (detail != null && detail is LikePostModel) {
      show_snackBarSuccess(
          title: "Post Reaction Updated",
          description: detail.message.toString());
      if (detail.message == "Post Unliked!") {
        _update_likePost(postId: int.parse(postId), reactionValue: -1);
      } else {
        _update_likePost(
            postId: int.parse(postId), reactionValue: int.parse(reactionType));
      }
    }
  }

  _update_likePost({required int postId, required int reactionValue}) {
    for (var element in _getAllPost.data!) {
      if (element.id == postId) {
        print("findeddd ${element.isLiked!}");
        element.isLiked = reactionValue;
        update();
        return;
      }
    }
  }

  Future<void> fetch_allPosts({bool isInitial = true}) async {
    if (isInitial) isLoading = true;
    var detail = await post_services.fetch_all_post_services(client: apiClient);
    if (isInitial) isLoading = false;
    if (detail is GetAllPost) {
      getAllPost = detail;
    }
  }



  //=====================================>> refresh things here
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void onRefresh() async {
    await fetch_allPosts(isInitial: false);
    update();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    refreshController.loadComplete();
  }

  //=======================================> GETTER SETTERS BELOW
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  GetAllPost get getAllPost => _getAllPost;

  set getAllPost(GetAllPost value) {
    _getAllPost = value;
    update();
  }
}

abstract class SinglePostApis {
  Future<void> requestToFollow({required String postId})async{

  }

  Future<void> blockUser({required String userId})async{
    print("BLOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOCK USER");
  }

  Future<void> savePost({required String postId})async{}

  Future<void> hidePost({required String postId})async{}

  Future<void> reportPost({required String postId})async{}
}
