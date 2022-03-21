import 'package:aidber/models/posts/all_posts_model.dart';
import 'package:aidber/services/posts/all_post_services.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class all_post_controller extends GetxController {
 @override
  onInit(){
    super.onInit();
    fetch_allPosts();
  }

  bool _isLoading = false;
  GetAllPost _getAllPost = GetAllPost();

  update_likePost({required String timeStampISO}){
    _getAllPost.data!.forEach((element) {
      if( element.createdAt!.toIso8601String() == timeStampISO){
        print("findeddd ${element.isLiked!}");
        element.isLiked =!element.isLiked!;
        update();
        return;
      }
    });
  }

  Future<void> fetch_allPosts({bool isInitial = true}) async {
    if(isInitial) isLoading = true;
    var detail = await all_post_services.fetch_all_post_services();
    if(isInitial) isLoading = false;
    if (detail is GetAllPost) {
      getAllPost = detail;
    }
  }


  //===>> refresh things here
 RefreshController refreshController =
 RefreshController(initialRefresh: false);

 void onRefresh() async{
   await fetch_allPosts(isInitial: false);
   update();
   refreshController.refreshCompleted();
 }

 void onLoading() async{

   refreshController.loadComplete();
 }

 //======> GETTER SETTERS BELOW
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
