// import 'package:comment_tree/widgets/comment_tree_widget.dart';
// import 'package:flutter/material.dart';
//
// import '../../../models/posts/comment_post_model.dart';
// class comment_tree_widget extends StatelessWidget {
//   Comment comment;
//    comment_tree_widget({required this.comment});
//   @override
//   Widget build(BuildContext context) {
//     return  CommentTreeWidget<Comment, Comment>(
//       comment.,
//
//       controller.commentList,
//       contentRoot: (context, data)=> Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(
//                 vertical: 8, horizontal: 8),
//             decoration: BoxDecoration(
//                 color: Colors.grey[100],
//                 borderRadius: BorderRadius.circular(12)),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   data.userName.toString(),
//                   style: Theme.of(context)
//                       .textTheme
//                       .caption!
//                       .copyWith(
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black),
//                 ),
//                 const SizedBox(
//                   height: 4,
//                 ),
//                 Text(
//                   '${data.content}',
//                   style: Theme.of(context)
//                       .textTheme
//                       .caption!
//                       .copyWith(
//                       fontWeight: FontWeight.w300,
//                       color: Colors.black),
//                 ),
//               ],
//             ),
//           ),
//           DefaultTextStyle(
//             style: Theme.of(context).textTheme.caption!.copyWith(
//                 color: Colors.grey[700],
//                 fontWeight: FontWeight.bold),
//             child: Padding(
//               padding: const EdgeInsets.only(top: 4),
//               child: Row(
//                 children: [
//                   const SizedBox(
//                     width: 8,
//                   ),
//                   const Text('Like'),
//                   const SizedBox(
//                     width: 24,
//                   ),
//                   const Text('Reply'),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//       avatarRoot: (context, data) => const PreferredSize(
//         child: CircleAvatar(
//           radius: 18,
//           backgroundColor: Colors.grey,
//           backgroundImage: AssetImage('assets/sajidmsd.jpg'),
//         ),
//         preferredSize: Size.fromRadius(18),
//       ),
//       //CHILDS STARTs HERE
//       avatarChild: (context, data) => const PreferredSize(
//         child: CircleAvatar(
//           radius: 12,
//           backgroundColor: Colors.grey,
//           backgroundImage: AssetImage('assets/google.jpg'),
//         ),
//         preferredSize: Size.fromRadius(12),
//       ),
//       contentChild: (context, data) => Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(
//                 vertical: 8, horizontal: 8),
//             decoration: BoxDecoration(
//                 color: Colors.grey[100],
//                 borderRadius: BorderRadius.circular(12)),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   data.userName.toString(),
//                   style: Theme.of(context)
//                       .textTheme
//                       .caption
//                       ?.copyWith(
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black),
//                 ),
//                 const SizedBox(
//                   height: 4,
//                 ),
//                 Text(
//                   '${data.content}',
//                   style: Theme.of(context)
//                       .textTheme
//                       .caption
//                       ?.copyWith(
//                       fontWeight: FontWeight.w300,
//                       color: Colors.black),
//                 ),
//               ],
//             ),
//           ),
//           DefaultTextStyle(
//             style: Theme.of(context).textTheme.caption!.copyWith(
//                 color: Colors.grey[700],
//                 fontWeight: FontWeight.bold),
//             child: Padding(
//               padding: const EdgeInsets.only(top: 4),
//               child: InkWell(
//                   onTap: () =>
//                       controller.commentNode.requestFocus(),
//                   child: const Text('Reply')),
//             ),
//           )
//         ],
//       ),
//       treeThemeData: TreeThemeData(lineColor: Colors.grey[500]!, lineWidth: 1),
//
//     );
//   }
// }
