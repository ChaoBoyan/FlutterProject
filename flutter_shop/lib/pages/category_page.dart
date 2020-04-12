import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttershop/model/categrory_entity.dart';
import 'package:fluttershop/service/service_method.dart';


class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  
  @override
  void initState() {
    getCategoryHttp().then((val){
      print(val["data"]["channel"]);
      CategroryEntity model = CategroryEntity().fromJson(val);
      model.data.channel.forEach((item){
        print(item.name);
      });


    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("分类"),
      ),
    );
  }
}
