
import 'package:flutter/material.dart';

class goodsDetail extends StatelessWidget {

  String title = "";

  goodsDetail({this.title});

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

      ),
    );
  }
}
