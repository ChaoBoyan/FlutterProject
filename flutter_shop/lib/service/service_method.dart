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


//http://iflow.uczzd.cn/iflow/api/v1/channels?app=uc-iflow&ab_tag=2343C2;2864B2;2957B2;2971A2;2882C2;2536H2;2999B2;2660A2;2339C2;2937A2;2940B2;2060C2;2900A2;&&puser=0&tab=video&uc_param_str=dnnivebichfrmintcpgimewidsudsvlissnwlobd&dn=54851312174-718e0547&nn=AATKyFSIyS4MX28pJTKYPtPvR3cOGOjbaUg8LOI5Njv0xw%3D%3D&ve=12.9.0.1292&bi=997&fr=iphone&mi=iPhone6%2C2&nt=2&pc=AAQRAtQtd9XY54gmHPf775eHbuf%2BYbC9eehroE%2BrJhJ2hVnH8IpdbEg5gELNRVLXEQL0hH4Dj1mbnBLqoQVUIAsn&me=AARImJtd3y76T%2Fi6xDzIDzR%2BrKiCTO2WPkvUmej8CN7dgXHeIsDJAe6YiHH3ptZ9CP4%3D&ut=AATJeTmOtTLec2BH8xAFS1RM%2BZT%2BuXs77da%2FrUdJUT7PYw%3D%3D&ai=AAQ%3D&sv=appa&lb=AAQbXUX3IfIEMgNbUxO7%2BHnK0erN5YqEUinjKFc56v5Rkg%3D%3D&ss=320x568&nw=WIFI&bd=apple
Future getCategoryHttp() async {

  try{
    Response response;
    var dio = Dio();
    print("分类 ---getCategoryHttp---");
    Options options = Options();
    options.headers = httpHeaders;
    response = await dio.get(
        "http://iflow.uczzd.cn/iflow/api/v1/channels?app=uc-iflow&ab_tag=2343C2;2864B2;2957B2;2971A2;2882C2;2536H2;2999B2;2660A2;2339C2;2937A2;2940B2;2060C2;2900A2;&&puser=0&tab=video&uc_param_str=dnnivebichfrmintcpgimewidsudsvlissnwlobd&dn=54851312174-718e0547&nn=AATKyFSIyS4MX28pJTKYPtPvR3cOGOjbaUg8LOI5Njv0xw%3D%3D&ve=12.9.0.1292&bi=997&fr=iphone&mi=iPhone6%2C2&nt=2&pc=AAQRAtQtd9XY54gmHPf775eHbuf%2BYbC9eehroE%2BrJhJ2hVnH8IpdbEg5gELNRVLXEQL0hH4Dj1mbnBLqoQVUIAsn&me=AARImJtd3y76T%2Fi6xDzIDzR%2BrKiCTO2WPkvUmej8CN7dgXHeIsDJAe6YiHH3ptZ9CP4%3D&ut=AATJeTmOtTLec2BH8xAFS1RM%2BZT%2BuXs77da%2FrUdJUT7PYw%3D%3D&ai=AAQ%3D&sv=appa&lb=AAQbXUX3IfIEMgNbUxO7%2BHnK0erN5YqEUinjKFc56v5Rkg%3D%3D&ss=320x568&nw=WIFI&bd=",
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