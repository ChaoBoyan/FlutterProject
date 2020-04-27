import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class goodsDetail extends StatelessWidget {

  String title = "";
//  fans ;desc;users;yyNum;snapshot
  String fans;
  String desc;
  String yyNum;
  String users;
  String snapshot;


  goodsDetail({this.title,this.fans,this.desc,this.yyNum,this.users,this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
          Navigator.pop(context);
        }),
        title: Text(title),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CachedNetworkImage(imageUrl: snapshot,fit: BoxFit.cover,width: MediaQuery.of(context).size.width,),
            SizedBox(height: 10,),
            Text(desc),
            SizedBox(height: 10,),
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("房间号：" + yyNum),
                Text("粉丝：" + fans),
                Text("在线：" + users),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
