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
            title: Text('私人情趣+'),
          ),
          body: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List list = (snapshot.data["users"]);
                List navList = posts.sublist(0,10);
                String adPicture = "http://img.pconline.com.cn/images/upload/upc/tx/photoblog/1408/26/c0/37863154_37863154_1409006331562.jpg";
//                litpic
                return Column(
                  children: <Widget>[
//                    1
                    SwiperDiy(swiperDateList: list),
//                    2
                    TopNavigator(navigatorList: navList),
//                    3
                    AdBanner(adPicture: adPicture),
//                    4
                  AuthorInfo(),
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
      height: 300.h,
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

//菜单menu
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

//广告栏
class AdBanner extends StatelessWidget {

  final String adPicture;

  AdBanner({Key key,this.adPicture}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: <Widget>[
          Image.network(adPicture,height: 100.h,width: 750.w,fit: BoxFit.fill,),
          SizedBox(height: 4,),
          Text("急，急，急，广告位招商..."),
          SizedBox(height: 5,child: Container(color: Colors.grey[300],),),
        ],
      ),
    );
  }
}

//作者电话
class AuthorInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
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
