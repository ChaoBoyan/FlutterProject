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
                List navList = posts.sublist(0,10);
//                litpic
                return Column(
                  children: <Widget>[
                    SwiperDiy(swiperDateList: list),
                    TopNavigator(navigatorList: navList),
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

//轮播
class SwiperDiy extends StatelessWidget {
  final List swiperDateList;

  SwiperDiy({this.swiperDateList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.w,
      width: 750.w,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
//          posts[index].imageUrl
          return Image.network(
            "${swiperDateList[index]["avatar_source"]}",
            fit: BoxFit.fill,
          );
        },
        itemCount: swiperDateList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

//
class TopNavigator extends StatelessWidget {
  final List<Post> navigatorList;

  TopNavigator({Key key, this.navigatorList}) : super(key: key);

  Widget _gridViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print("click Navigator");
      },
      child: Column(

        children: <Widget>[
//          Image.network("${item.imageUrl}",width: 95.w,),
//          ClipRRect(child: Image.network("${item.imageUrl}",width: 95.w),borderRadius: BorderRadius.circular(6.0),),
          CircleAvatar(
            backgroundImage: NetworkImage("${item.imageUrl}"),
//            radius: 95.w,
          ),
          SizedBox(height: 4,),
          Text("商品"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Colors.red,
      height: 320.w,

      padding: EdgeInsets.fromLTRB(0.0,10.0,0,0.0),
      child: GridView.count(

        crossAxisCount: 5,
        physics: NeverScrollableScrollPhysics(),
//        primary: false,
        mainAxisSpacing: 10.w,
        crossAxisSpacing: 10.w,

        children: navigatorList.map((item){
         return  _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }
}
