import 'package:aidber/models/posts/get_single_comment_model.dart';
import 'package:aidber/screens/comment_screen/controllers/comment_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:comment_tree/widgets/comment_tree_widget.dart';
import 'package:comment_tree/widgets/tree_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/posts/comment_post_model.dart';
class comment_tree_widget extends GetView<comment_controller> {
  Comment comments;
   comment_tree_widget({Key? key, required this.comments}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  CommentTreeWidget<Comment, Comment>(
      comments,

      comments.replies??[],
      contentRoot: (context, data)=> Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.user!.fullName.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  '${data.content}',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          DefaultTextStyle(
            style: Theme.of(context).textTheme.caption!.copyWith(
                color: Colors.grey[700],
                fontWeight: FontWeight.bold),
            child:  Padding(
              padding: const EdgeInsets.only(top: 4),
              child: InkWell(
                  onTap:  () {
                    controller.replyCommentId = data.id.toString();
                    controller.commentNode.requestFocus();
                  },
                  child: const Text('Reply')),
            ),
          )
        ],
      ),
      avatarRoot: (context, data) =>  PreferredSize(
        child: CircleAvatar(
          radius: 18,
          backgroundColor: Colors.grey,
        child:CachedNetworkImage(
          imageUrl:  data.user == null? "":data.user!.profilePictureUrl.toString(),
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        ),
        preferredSize: Size.fromRadius(18),
      ),
      //CHILDS STARTs HERE
      avatarChild: (context, data) =>  PreferredSize(
        child: CircleAvatar(
          radius: 12,
          backgroundColor: Colors.grey,
          child:CachedNetworkImage(
            imageUrl:  data.user == null? "":data.user!.profilePictureUrl.toString(),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        preferredSize: Size.fromRadius(12),
      ),
      contentChild: (context, data) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.user!.fullName.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  '${data.content}',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          DefaultTextStyle(
            style: Theme.of(context).textTheme.caption!.copyWith(
                color: Colors.grey[700],
                fontWeight: FontWeight.bold),
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: InkWell(
                  onTap: () {
                    controller.replyCommentId =comments.id.toString();
                    controller.commentNode.requestFocus();
                  },
                  child: const Text('Reply')),
            ),
          )
        ],
      ),
      treeThemeData:  TreeThemeData(lineColor: comments.replies!.isEmpty? Colors.transparent : Colors.grey.shade500, lineWidth: 1),

    );
  }
}