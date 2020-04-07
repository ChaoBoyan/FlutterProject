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
  try {
    Response response;
    var dio = Dio();

    Options options = Options();
    options.headers = httpHeaders;
    response = await dio.get(
        'https://www.jianshu.com/users/recommended?seen_ids=&count=10&only_unfollowed=false',
        options: options);
    return response.data;
  } catch (e) {
    return (e);
  }
}