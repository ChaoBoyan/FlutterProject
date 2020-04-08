import 'package:flutter/material.dart';
import 'package:fluttershop/config/Post.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircleAvatar(
          backgroundImage: NetworkImage("${posts[0].imageUrl}"),
          radius: 95.w,
        ),
      ),
    );
  }
}
