//  data 用于post请求传参； queryParameters 用于get请求传参
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