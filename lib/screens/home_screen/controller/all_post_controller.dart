import 'package:aidber/data/services/posts/post_services.dart';
import 'package:aidber/models/local/SuccessOrErrorMessageModel.dart';
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
    refreshController = RefreshController(initialRefresh: false);
  }

  @override
  onReady() {
    refreshController.position?.addListener(() {
      print(refreshController.position?.maxScrollExtent);
      if (refreshController.position?.maxScrollExtent == refreshController.position?.pixels) {
        print("FETTTTTTTTTTCH");
        fetch_allPosts();
      }
    });
  }

  bool _isLoading = false;
  GetAllPost _getAllPost = GetAllPost();
  List<Posts> allPostsList = [];

  reactAPost({required String postId, required String reactionType}) async {
    var detail = await post_services.like_post(client: apiClient, post_id: postId, type: reactionType);
    if (detail != null && detail is LikePostModel) {
      show_snackBarSuccess(title: "Post Reaction Updated", description: detail.message.toString());
      if (detail.message == "Post Unliked!") {
        _update_likePost(postId: int.parse(postId), reactionValue: -1);
      } else {
        _update_likePost(postId: int.parse(postId), reactionValue: int.parse(reactionType));
      }
    }
  }

  _update_likePost({required int postId, required int reactionValue}) {

    for (var element in allPostsList) {
      if (element.id == postId) {
        print("findeddd ${element.isLiked!}");
        element.isLiked?.likeType?.id = reactionValue.toString();
        update();
        break;
      }
    }
  }

  hidePostLocally(String postId){
    allPostsList.removeWhere((element) => element.id == postId);
  // _getAllPost.data?.data?.removeWhere((element) => element.id.toString() == postId);
   update();
   hidePost(postId: postId);
  }
  Future<void> fetch_allPosts({bool isInitial = true}) async {
    if (isInitial) isLoading = true;
    var detail = await post_services.fetch_all_post_services(client: apiClient);
    if (isInitial) isLoading = false;
    if (detail is GetAllPost) {
      getAllPost = detail;
      getAllPost.data?.data?.forEach((element) {
        allPostsList.addIf(!allPostsList.contains(element), element);
      });
      update();

    }
  }

  //=====================================>> refresh things here
  late RefreshController refreshController;

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
  Future<void> requestToFollow({required String userId, required bool isFollow}) async {
    SuccessOrMessageModel? response = await post_services.requestToFollow(user_id: userId, isFollow: isFollow);
    if (response != null) {
      response.isError
          ? show_snackBarError(title: "Unable To Process", description: response.message)
          : showSnackBarInformation(description: response.message);
    } else {
      show_snackBarError(title: "Unable To Process", description: "Your Request wasn't processed");
    }
  }

  Future<void> blockUser({required String userId}) async {
    SuccessOrMessageModel? response = await post_services.blockUser(user_id: userId);

    response.isError
        ? show_snackBarError(title: "Unable To Process", description: response.message)
        : showSnackBarInformation(description: response.message);
  }

  Future<void> savePost({required String postId}) async {
    SuccessOrMessageModel isSuccess = await post_services.savePost(post_id: postId);
    if (!isSuccess.isError) {
      showSnackBarInformation(description: "Post has been saved");
    } else {
      show_snackBarError(title: "Unable To Process", description: "Your Request wasn't processed");
    }
  }

  Future<void> hidePost({required String postId}) async {

  }

  Future<void> sharePost({required String postId}) async {
    bool isSuccess = await post_services.sharePost(post_id: postId);
    if (isSuccess) {
      showSnackBarInformation(description: "Post has been shared!");
    } else {
      show_snackBarError(title: "Unable To Process", description: "Your Request wasn't processed");
    }
  }

  Future<void> reportPost({required String postId}) async {}
}



extension IterableExtension<T> on Iterable<T> {
  Iterable<T> distinctBy(Object Function(T e) getCompareValue) {
    var result = <T>[];
    forEach((element) {
      if (!result.any((x) => getCompareValue(x) == getCompareValue(element))) {
        result.add(element);
      }
    });

    return result;
  }
}

extension IterableExtension2<T> on Iterable<T> {
  Iterable<T> distinctByMultiple(Object Function(T e) getCompareValue, Object Function(T e) getCompareValue2) {
    var result = <T>[];
    forEach((element) {
      if (!result.any((x) => getCompareValue(x) == getCompareValue(element) && getCompareValue2(x) == getCompareValue2(element))) {
        result.add(element);
      }
    });

    return result;
  }
}