import 'package:flutter/material.dart';
import 'package:fluttershop/provide/counter.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provide/provide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
      ),
      body: Center(
        child:
        WebView(
          initialUrl:
          'https://juejin.im/user/5e3921faf265da57375c2e28',
        ),
//        Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Number(),
//            Mybutton(),
//          ],
//        ),
      ),
    );
  }
}

class Number extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provide<Counter>(
        builder: (context, child, counter) {

          return Text("${counter.value}",style: TextStyle(fontSize: 30),);
        },
      ),
    );
  }
}

class Mybutton extends StatelessWidget {
  void _showCustomWidgetToast() {
    var w = Center(
      child: Container(
        width: 750.w * 3 / 4,
        height: 50,
        padding: const EdgeInsets.all(5),
        color: Colors.black.withOpacity(0.7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.check,
              color: Colors.white,
            ),
            Text(
              '点赞成功',
              style: TextStyle(color: Colors.white),
            ),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
    showToastWidget(w);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          Provide.value<Counter>(context).increament();
          _showCustomWidgetToast();
        },
        child: Text("点赞"),
      ),
    );
  }
}
