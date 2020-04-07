import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttershop/config/Post.dart';
import 'package:fluttershop/service/service_method.dart';
import '../config/Config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('美好人间'),
          ),
          body: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List list = (snapshot.data["users"]);
//                litpic
                return Column(
                  children: <Widget>[
                    SwiperDiy(swiperDateList: list),
                  ],
                );
              } else {
                return Center(
                  child: Text("加载中...."),
                );
              }
            },
            future: getHttp(),
          )),
    );
  }
}

class SwiperDiy extends StatelessWidget {
  final List swiperDateList;

  SwiperDiy({this.swiperDateList});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,width: 750,height: 1334);
    return Container(
      height: 240.h,
      width: 750.w,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
//          posts[index].imageUrl
          return Image.network("${swiperDateList[index]["avatar_source"]}",fit: BoxFit.fill,);
        },
        itemCount: swiperDateList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}
