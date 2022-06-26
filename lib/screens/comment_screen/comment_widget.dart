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
                    padding: EdgeInsets.all(12),
                    itemCount: controller.commentPostList!.first.comments?.length  ,
                    itemBuilder: (context, index) {
                      return  Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: comment_tree_widget(comments: controller.commentPostList!.first.comments![index],),
                      );

                      /*return CommentTreeWidget<Comment, Comment>(
                    Comment(
                        commentId: '1',
                        avatar: 'null',
                        userName: 'B A A H A A D U R',
                        content: 'My root Comment '),

                    controller.commentList,
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
                                data.userName.toString(),
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
                                    fontWeight: FontWeight.w300,
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
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text('Like'),
                                const SizedBox(
                                  width: 24,
                                ),
                                const Text('Reply'),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    avatarRoot: (context, data) => const PreferredSize(
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage('assets/sajidmsd.jpg'),
                      ),
                      preferredSize: Size.fromRadius(18),
                    ),
                    //CHILDS STARTs HERE
                    avatarChild: (context, data) => const PreferredSize(
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage('assets/google.jpg'),
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
                                data.userName.toString(),
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
                                    fontWeight: FontWeight.w300,
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
                                onTap: () =>
                                    controller.commentNode.requestFocus(),
                                child: const Text('Reply')),
                          ),
                        )
                      ],
                    ),
                    treeThemeData: TreeThemeData(lineColor: Colors.grey[500]!, lineWidth: 1),

                  );*/
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
