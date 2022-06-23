import 'package:aidber/controllers/storage_controller/storage_controller.dart';
import 'package:aidber/data/services/posts/comment_post_services.dart';
import 'package:aidber/models/posts/comment_post_model.dart';
import 'package:aidber/utils/api_urls.dart';
import 'package:aidber/utils/utils.dart';
import 'package:comment_tree/data/comment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api.dart';

class comment_controller extends GetxController {
  TextEditingController commentController = TextEditingController();
  FocusNode commentNode = FocusNode();
  List<Comment> commentList = [
    Comment(
        avatar: 'null',
        userName: 'null',
        content: 'ONLY TEST IS this okkkkkkk'),
    Comment(
        avatar: 'null', userName: 'null', content: "WOOWOWOW WOWOW WOWW WOWW "),
  ];

  addToCommentList({required String postId}) {
    commentList.add(Comment(
        avatar: 'null', userName: 'null', content: commentController.text));

    post_comment(comment:commentController.text,post_id: postId );
    commentController.clear();
    commentNode.unfocus();
    update();
  }

  post_comment({required String comment, required String post_id}) async {
    var detail = await comment_post_services.comment(
        client: ApiClient(
            appBaseUrl: api_urls.BASE_URL,
            storageController: Get.find<storage_controller>()),
        post_id: post_id,
        comment: comment);

    if (detail != null && detail is CommentPostModel) {
      show_snackBarSuccess(
          title: "Comment posted", description: detail.message ?? "");
    }
  }
}
