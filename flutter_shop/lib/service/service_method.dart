//  data 用于post请求传参； queryParameters 用于get请求传参
//图片来源 网络数据，如有侵权，请联系我
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:fluttershop/config/Config.dart';
//getHttp().then((val) {
//print("load finish");
//setState(() {
//List listItem = List.from(val["users"]);
//listItem.forEach((value) {
//print(value["nickname"]);
//});
//showText = val["users"][0]["nickname"].toString();
//});
//});
Future getHttp() async {

  try{
    Response response;
    var dio = Dio();
    print("请求 ---getHttp---");
    Options options = Options();
    options.headers = httpHeaders;
    response = await dio.get(
        'https://www.jianshu.com/users/recommended?seen_ids=666&count=5&only_unfollowed=true',
        options: options);
    if (response.statusCode == 200) {
      return response.data;
    }else{
      throw Exception("接口异常");
    }
  }catch(e){
    return print("Error:-------${e.toString()}");
  }
}

//https://data.3g.yy.com/mobyy/nav/talk/tkxjczb?bkt=0&channel=appstore&compAppid=yymip&hdid=269ee537c7deef169a73910c294eb2918db7cc7e&ispType=2&loadType=1&netType=2&osVersion=11.3&stype=2&uid=432353578&y0=92bda6cc1a3e43b3d50d0cdec37e8b2c905227040d0cda48dd8d72c4e61a84460a31b2558e88fdb9483f96f92005584e&y1=92bda6cc1a3e43b3d50d0cdec37e8b2c905227040d0cda48dd8d72c4e61a84460a31b2558e88fdb9483f96f92005584e&y11=4b09872c706ef60142f1bdaef5a6f807&y12=9d8393ec004d98b7e20f0c347c3a8c24&yv=1&yyVersion=7.29.0
Future getYYHttp(page) async {

  try{
    Response response;
    var dio = Dio();
    print("上菜 ---getYYHttp---");
    Options options = Options();
    options.headers = httpHeaders;
    response = await dio.get(
        'https://data.3g.yy.com/mobyy/module/dance/wdjczb/448109?channel=appstore&compAppid=yymip&hdid=269ee537c7deef169a73910c294eb2918db7cc7e&ispType=2&netType=2&osVersion=11.3&page=${page}&stype=2&uid=432353578&y0=92bda6cc1a3e43b3d50d0cdec37e8b2c905227040d0cda48dd8d72c4e61a84460a31b2558e88fdb9483f96f92005584e&y1=92bda6cc1a3e43b3d50d0cdec37e8b2c905227040d0cda48dd8d72c4e61a84460a31b2558e88fdb9483f96f92005584e&y11=4b09872c706ef60142f1bdaef5a6f807&y12=9d8393ec004d98b7e20f0c347c3a8c24&yv=1&yyVersion=7.29.0',
        options: options);
//    print(response.data["data"]["data"]);
    if (response.statusCode == 200) {
      return response.data;
    }else{
      throw Exception("接口异常");
    }
  }catch(e){
    return print("Error:-------${e.toString()}");
  }
}


