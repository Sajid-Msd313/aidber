import 'package:aidber/controllers/storage_controller/storage_controller.dart';
import 'package:aidber/data/services/posts/post_services.dart';
import 'package:aidber/models/posts/comment_post_model.dart';
import 'package:aidber/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/auth/login_model.dart';
import '../../../models/posts/get_single_comment_model.dart';

class comment_controller extends GetxController {
  final String postId;

  comment_controller({required this.postId});

  @override
  onInit() {
    super.onInit();
    fetch_comment();
  }

  List<SingleComment>? commentPostList;
  bool _isLoading = false;
  TextEditingController commentController = TextEditingController();
  FocusNode commentNode = FocusNode();

/*  addToCommentList({required String postId, bool isReply = false}) {
    if (isReply) {
      commentList.add(tree.Comment(
          commentId: "2",
          avatar: 'null',
          userName: 'you',
          content: commentController.text));

      post_comment(comment: commentController.text, post_id: postId);
    }

  }*/

  String replyCommentId = "";

  validateCommentToPost() {
    if (commentController.text.isEmpty) {
      return;
    }
    post_comment(
        comment: commentController.text,
        post_id: postId,
        replyToId: replyCommentId);
  }

  addToCommentList({required Comment comment}) {
    Result? userData =     Get.find<storage_controller>().userModel.result;
    //adding userData so that null issue is resolved...
    comment.user = User(
       id: 1,
       username: "",
       fullName: 'You',
       profilePictureUrl: userData?.userImage?? "",
     );



    if (comment.replyTo != null) {
      int? parentCommentIndex = commentPostList?.first.comments
          ?.indexWhere((element) => element.id.toString() == comment.replyTo);
      if (parentCommentIndex != null) {
        print("indexxxx $parentCommentIndex");
        commentPostList?.first.comments![parentCommentIndex].replies
            ?.add(comment);
      }
    } else {
      commentPostList?.first.comments?.add(comment);
      update();
    }

    replyCommentId = "";
  }

  void fetch_comment() async {
    isLoading = true;
    var detail = await post_services.getCommentsByPostId(post_id: postId);
    if (detail != null && detail is List<SingleComment>) {
      commentPostList = detail;
    }
    isLoading = false;
  }

  void post_comment(
      {required String comment,
      required String post_id,
      String replyToId = ""}) async {
    commentController.clear();
    commentNode.unfocus();
    var detail = await post_services.postComment(
        post_id: post_id, reply_to: replyToId, comment: comment);

    if (detail != null && detail is CommentPostModel && detail.data != null) {
      addToCommentList(comment: detail.data!);
      show_snackBarSuccess(title: "Comment posted", description: detail.message ?? "");
    } else {
      print("error from post_comment ${detail.runtimeType}");
    }

    update();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }
}
