import 'package:aidber/controllers/storage_controller/storage_controller.dart';
import 'package:aidber/data/services/posts/post_services.dart';
import 'package:aidber/models/posts/comment_post_model.dart';
import 'package:aidber/utils/api_urls.dart';
import 'package:aidber/utils/utils.dart';
import 'package:comment_tree/data/comment.dart' as tree;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api.dart';

class comment_controller extends GetxController {
  TextEditingController commentController = TextEditingController();
  FocusNode commentNode = FocusNode();
  List<tree.Comment> commentList = [
    tree.Comment(
        commentId: "2",
        avatar: 'null',
        userName: 'LKJSKLD',
        content: 'ONLY TEST IS this okkkkkkk'),
    tree.Comment(
        commentId: "2",
        avatar: 'SOMEONE',
        userName: 'SOMEONE',
        content: "WOOWOWOW WOWOW WOWW WOWW "),
    tree.Comment(
        commentId: "2",
        avatar: 'HEHEH',
        userName: 'HEHEH',
        content: "WOOWOWOW WOWOW WOWW WOWW "),
  ];

  addToCommentList({required String postId, bool isReply = false}) {
    if (isReply) {
      commentList.add(tree.Comment(
          commentId: "2",
          avatar: 'null',
          userName: 'you',
          content: commentController.text));

      post_comment(comment: commentController.text, post_id: postId);
    } else {
      //tree comment
    }
    commentController.clear();
    commentNode.unfocus();
    update();
  }

  post_comment(
      {required String comment,
      required String post_id,
      String replyToId = ""}) async {
    var detail = await post_services.comment(
        client: ApiClient(
            appBaseUrl: api_urls.BASE_URL,
            storageController: Get.find<storage_controller>()),
        post_id: post_id,
        reply_to: replyToId,
        comment: comment);

    if (detail != null && detail is CommentPostModel) {
      show_snackBarSuccess(
          title: "Comment posted", description: detail.message ?? "");
    }
  }
}
