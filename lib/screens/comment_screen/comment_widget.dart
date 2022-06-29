import 'package:aidber/models/posts/comment_post_model.dart';
import 'package:aidber/screens/comment_screen/controllers/comment_controller.dart';
import 'package:aidber/screens/comment_screen/widget/comment_tree_widget.dart';
import 'package:comment_tree/data/comment.dart';
import 'package:comment_tree/widgets/comment_tree_widget.dart';
import 'package:comment_tree/widgets/tree_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/colors.dart';

class comment_widget extends GetView<comment_controller> {
  final String postId;
  comment_widget({required this.postId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        title: const Text(
          'Post A Comment',
          style: TextStyle(color: Colors.white, fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<comment_controller>(
              init: Get.find<comment_controller>(),
              builder: (controller) {
                if(controller.isLoading){
                  return const Center(child: CircularProgressIndicator(),);
                }
                if(controller.commentPostList == null ||  controller.commentPostList?.first.comments == null || controller.commentPostList!.first.comments!.isEmpty){
                  return const Center(child: Text('Be first to comment'),);
                }
                return ListView.builder(
                  shrinkWrap: true,
                    padding: const EdgeInsets.all(12),
                    itemCount: controller.commentPostList!.first.comments?.length  ,
                    itemBuilder: (context, index) {
                      return  Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: comment_tree_widget(comments: controller.commentPostList!.first.comments![index],),
                      );
                });
              }
            ),
          ),
          Flexible(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                focusNode: controller.commentNode,
                controller: controller.commentController,
                autocorrect: false,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () => controller.validateCommentToPost()),
                  labelText: "Type your comment here.",
                  labelStyle:
                      const TextStyle(fontSize: 14.0, color: Colors.black),
                  fillColor: Colors.blue,
                  border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all( Radius.circular(20)),
                      borderSide: BorderSide(color: Theme.of(context).primaryColor)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
