import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttershop/generated/json/live_t_v_entity_helper.dart';
import 'package:fluttershop/model/categrory_entity.dart';
import 'package:fluttershop/model/live_t_v_entity.dart';
import 'package:fluttershop/service/service_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  List listTitleDate = [];


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
    getLiveTVCategoryHttp().then((val){
      LiveTVEntity model = LiveTVEntity().fromJson(val);
      setState(() {
        listTitleDate = model.data;
        model.data.forEach((item){
          print(item.name);
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
      body: Container(
        child: Row(
          children: <Widget>[
            _leftListView(),
          ],
        ),
      ),
    );
  }

  Widget _leftListView() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: Colors.black12,width: 1),
        ),
      ),
      width: 180.w,

      child: ListView.builder(itemBuilder: (context,index){
        return _itemInkWell(index);
      },itemCount: listTitleDate.length,),
    );
  }


  Widget _itemInkWell(index) {
    return Container(
      height: 120.w,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black12,width: 1)
        ),
      ),
      child: InkWell(
        child: Row(
          children: <Widget>[
            SizedBox(width: 12,),
            Text("${listTitleDate[index].name}"),
          ],
        ),
      ),
    );
  }
}
