import 'package:flutter/material.dart';
import 'package:fluttershop/config/Post.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthorInfo(),
    );
  }
}

//作者电话
class AuthorInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage("https://upload.jianshu.io/users/upload_avatars/2927423/37128c7f-32ea-45aa-8929-6fc64ef164e6.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240"),
            radius: 60.w,
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("姓名：Chaoboyan"),
              Text("简介：iOS从事多年，独立开发"),
              Text("地址：https://github.com/ChaoBoyan"),
              Text("邮箱：1297595138@qq.com"),
            ],
          ),
        ],
      ),
    );
  }
}