// import 'package:aidber/global_widgets/appbar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../global_widgets/colors.dart';
// class tag_people_screen extends StatelessWidget {
//   const tag_people_screen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Tag People"),
//         backgroundColor: PRIMARY_COLOR,
//         leading: IconButton(
//           icon: Icon(Icons.cancel_outlined),
//           onPressed: Get.back,
//         ),
//       ),
//       body: DropdownSearch<UserModel>(
//
//         dropdownSearchDecoration: InputDecoration(labelText: "Name"),
//         onFind: ( filter) async {
//         /*  var response = await Dio().get(
//             "http://5d85ccfb1e61af001471bf60.mockapi.io/user",
//             queryParameters: {"filter": filter},
//           );
//           var models = UserModel.fromJsonList(response.data);*/
//           await Future.delayed(Duration(seconds: 3));
//           return dummyUsers;
//         },
//         onChanged: (UserModel? data) {
//           print(data);
//         },
//       ),
//     );
//   }
// }
//
//
// List<UserModel> dummyUsers = [
//   UserModel(id: "1",createdAt: DateTime.now(), name: "bahadur"),
//   UserModel(id: "2",createdAt: DateTime.now(), name: "zaman"),
//   UserModel(id: "3",createdAt: DateTime.now(), name: "khan"),
//   UserModel(id: "4",createdAt: DateTime.now(), name: "wow"),
//   UserModel(id: "5",createdAt: DateTime.now(), name: "random"),
// ];
class UserModel {
  final String? id;
  final DateTime? createdAt;
  final String? name;
  final String? avatar;

  UserModel({this.id, this.createdAt, this.name, this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      createdAt: DateTime.parse(json["createdAt"]),
      name: json["name"],
      avatar: json["avatar"],
    );
  }

  static List<UserModel>? fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => UserModel.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '#${this.id} ${this.name}';
  }

  ///this method will prevent the override of toString
  bool userFilterByCreationDate(String filter) {
    return this.createdAt.toString().contains(filter);
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(UserModel model) {
    return this.id == model.id;
  }

  @override
  String toString() => name.toString();
}