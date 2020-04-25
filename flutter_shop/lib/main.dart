import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:fluttershop/pages/index_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provide/provide.dart';

import 'provide/counter.dart';

//代码格式化快捷键  option + commond + L
void main() {
  var counter = Counter();
  var provides = Providers();
  provides..provide(Provider<Counter>.value(counter))
//  ..provide(provider)
      ;

  runApp(ProviderNode(child: MyApp(), providers: provides));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
//      locale: Locale("zh","CN"),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalEasyRefreshLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''),
        Locale('zh', 'CN'),
      ],
      home: IndexPage(),
    );
  }
}
