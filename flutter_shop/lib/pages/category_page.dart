import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttershop/generated/json/live_t_v_entity_helper.dart';
import 'package:fluttershop/model/categrory_entity.dart';
import 'package:fluttershop/model/live_t_v_entity.dart';
import 'package:fluttershop/provide/counter.dart';
import 'package:fluttershop/service/service_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provide/provide.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List listTitleDate = [];

  String rightImgUrl = "";

  @override
  void initState() {
//    getCategoryHttp().then((val){
//      CategroryEntity model = CategroryEntity().fromJson(val);
//      listTitleDate = model.data.channel;
////      model.data.channel.forEach((item){
////        print(item.name);
////      });
//    });
    super.initState();
  }

  void _getCatogeryList() {
    getLiveTVCategoryHttp().then((val) {
      LiveTVEntity model = LiveTVEntity().fromJson(val);
      setState(() {
        listTitleDate = model.data;
        model.data.forEach((item) {
          print(item);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("内容分类"),
        ),
        body: FutureBuilder(
          future: getLiveTVCategoryHttp(),
          builder: (context, snapate) {
            if (snapate.hasData) {
              LiveTVEntity model = LiveTVEntity().fromJson(snapate.data);
              listTitleDate = model.data;

              return Container(
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _leftListView(),

                    SingleChildScrollView(
                    child:  Container(
//                      color: Colors.red,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        width: (750 - 180 - 10).w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Provide<Counter>(
                                builder: (context, child, counter) {
//                              width: (750 - 180 - 10).w,
//                              height: (750 - 180 - 10).w,
                              return CachedNetworkImage(
                                  imageUrl:
                                      listTitleDate[counter.selectIndex].pic,
                                );
                            }),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            else {
              return Text(" ");
            }
          },
        )
//
        );
  }

  Widget _leftListView() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: Colors.black12, width: 1),
        ),
      ),
      width: 180.w,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return _itemInkWell(index);
        },
        itemCount: listTitleDate.length,
      ),
    );
  }

  Widget _itemInkWell(index) {
    LiveTVData model = listTitleDate[index];
    return Provide<Counter>(builder: (context, child, counter) {
      var isSelect = counter.selectIndex == index ? true : false;
      return Container(
        height: 120.w,
        decoration: BoxDecoration(
          color: isSelect ? Colors.black12 : Colors.white,
          border: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
        ),
        child: InkWell(
          onTap: () {
            showToast(model.name);
            Provide.value<Counter>(context).changeSelectIndex(index);
//            var counterValue = Provide.value<Counter>(context).value;
//            print("人气值：" + "${counterValue}");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 6),
              CachedNetworkImage(
                width: 44.w,
                height: 44.w,
                imageUrl: model.pic,
                placeholder: (context, _) {
                  return Icon(Icons.replay_10);
                },
              ),
              SizedBox(width: 3),
              Text("${model.name}"),
            ],
          ),
        ),
      );
    });
  }
}
