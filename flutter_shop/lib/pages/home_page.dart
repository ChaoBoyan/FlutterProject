import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:fluttershop/config/Post.dart';
import 'package:fluttershop/pages/goodDetail_page.dart';
import 'package:fluttershop/service/service_method.dart';
import '../config/Config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  // 是否开启刷新
  bool _enableRefresh = true;

  EasyRefreshController _refreshcontro = EasyRefreshController();

  int _randomMoney(int len, {double percent = 1}) {
    String scopeF = "123456789"; //首位
    String scopeC = "0123456789"; //中间
    String result = "";
    for (int i = 0; i <= len; i++) {
      if (i == 1) {
        result = scopeF[Random().nextInt(scopeF.length)];
      } else {
        result = result + scopeC[Random().nextInt(scopeC.length)];
      }
    }

    return (int.parse(result) * percent).toInt();
  }

  int page = 1;
  List beatyList = [];

  @override
  void initState() {
    // TODO: implement initState
//    _getBeaty();
    super.initState();
  }

//  主赞助商 数据
  var mainMoney = [
    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3239140714,3273296400&fm=26&gp=0.jpg",
    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1330117398,688710973&fm=26&gp=0.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586460081246&di=2443737a878bac63219add725e7ddaae&imgtype=0&src=http%3A%2F%2Fhahae.ewoka.com%2Fuploads%2Fallimg%2F141030%2F724253_141030104913_4.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586459677387&di=0883f8b8949835698a2f5a4b9456c713&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2Fe%2F594cc67512620.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    print(locale.toString());
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('首页'),
          ),
          body: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List list = (snapshot.data["users"]);
                List navList = posts.sublist(0, 10);
                String adPicture = mainMoney.last;
//
                List recommondList = posts.sublist(11, posts.length);
//                litpic
                return EasyRefresh(
                  controller: _refreshcontro,
                  header: ClassicalHeader(
                    showInfo: false,
                  ),
                  footer: ClassicalFooter(
                    showInfo: false,
                  ),
                  child: ListView(
                    children: <Widget>[
//                    1
                      SwiperDiy(swiperDateList: list),
//                    2
                      TopNavigator(navigatorList: navList),
//                    3
                      AdBanner(adPicture: adPicture),
//                    4
                      Recommend(
                        recommendList: recommondList,
                      ),
//                      5.1
                      CollectTitle(
                        imgStr: mainMoney[0],
                      ),
                      CollectView(
                        collectList: posts,
                      ),
//                         5.2
                      CollectTitle(
                        imgStr: mainMoney[1],
                      ),
                      CollectView(
                        collectList: posts,
                      ),
                      CollectTitle(
                        imgStr: mainMoney[2],
                      ),
                      CollectView(
                        collectList: posts,
                      ),

                      _hotBeatyWidget(),

                      beatyList.length >= 40
                          ? Container(
                              child: Text(
                                "--触碰到最后底线了--",
                                style: TextStyle(color: Colors.grey),
                              ),
                              padding: EdgeInsets.all(10.0),
                              alignment: Alignment.center,
                            )
                          : SizedBox(
                              height: 0.0,
                            )
                    ],
                  ),
                  onRefresh: () async {
                    setState(() {
                      page = 1;
                      _enableRefresh = true;
                      beatyList.clear();
                    });
                    _refreshcontro.resetLoadState();
                    print("上拉加载...${page}");

                    await _getBeaty();
                  },
                  onLoad: _enableRefresh
                      ? () async {
                          print("加载更多...");
                          await _getBeaty();
                          beatyList.length >= 40
                              ? _enableRefresh = false
                              : _enableRefresh = true;
                        }
                      : null,
                );
              } else {
                return Center(
                  child: Text("加载中...."),
                );
              }
            },
            future: getHttp(),
          )),
    );
  }

  void _getBeaty() {
    getYYHttp(page).then((val) {
      List newList = val["data"]["data"];
      setState(() {
        beatyList.addAll(newList);
        page++;
      });
    });
  }

//  火爆 专区标题
  Widget hotTitle = Container(
    margin: EdgeInsets.only(bottom: 8.0),
    alignment: Alignment.center,
    color: Colors.transparent,
    child: Text(
      "🍆火爆专区",
      style: TextStyle(color: Colors.pink, fontSize: 30.ssp),
    ),
  );

//  火爆 beaty List
  Widget _wrapList() {
    if (beatyList.length != 0) {
      List<Widget> widgetList = beatyList.map((val) {
//        print(val);
        final moneyTotal = _randomMoney(4);
        final moneySale = (moneyTotal * 0.8).toInt();

        return InkWell(
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (BuildContext context) {
              return new goodsDetail(
                title: val["name"],
                fans: "${val["fans"]}",
                desc: val["desc"],
                users: "${val["users"]}",
                yyNum: "${val["yyNum"]}",
                snapshot: val["snapshot"],
              );
//              fans ;desc;users;yyNum;snapshot
            }));
          },
          child: Container(
            width: (375 - 10 - 2 * 10).w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CachedNetworkImage(
                  width: (375 - 10 - 2 * 10).w,
                  height: ((375 - 10 - 2 * 10)).w,
                  imageUrl: val["img"],
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
//                Image.network(val["img"],width: (375 - 10 - 2*10).w,height: ((375 - 10 - 2*10)).w,fit: BoxFit.cover,),
                Text(
                  val["name"],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.pink, fontSize: 26.ssp),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("￥${moneySale}"),
                    Text(
                      "￥${moneyTotal}",
                      style: TextStyle(
                          color: Colors.pink,
                          decoration: TextDecoration.lineThrough),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList();

      return Container(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
        child: Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: widgetList,
        ),
      );
    } else {
      return Text("暂无数据");
    }
  }

  Widget _hotBeatyWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          hotTitle,
          _wrapList(),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

//轮播
class SwiperDiy extends StatelessWidget {
  final List swiperDateList;

  SwiperDiy({this.swiperDateList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: 750.w,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
//          posts[index].imageUrl
//          return Image.network(
//            "${swiperDateList[index]["avatar_source"]}",
//            fit: BoxFit.fill,
//          );
          return CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: "${swiperDateList[index]["avatar_source"]}",
          );
        },
        itemCount: swiperDateList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

//菜单menu
class TopNavigator extends StatelessWidget {
  final List<Post> navigatorList;

  TopNavigator({Key key, this.navigatorList}) : super(key: key);

  Widget _gridViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print("click Navigator");
      },
      child: Column(
        children: <Widget>[
//          Image.network("${item.imageUrl}",width: 95.w,),
//          ClipRRect(child: Image.network("${item.imageUrl}",width: 95.w),borderRadius: BorderRadius.circular(6.0),),
          CircleAvatar(
            backgroundImage: NetworkImage("${item.imageUrl}"),
//            radius: 95.w,
          ),
          SizedBox(
            height: 4,
          ),
          Text("商品"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Colors.red,
      height: 320.w,

      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0, 0.0),
      child: GridView.count(
        crossAxisCount: 5,
        physics: NeverScrollableScrollPhysics(),
//        primary: false,
        mainAxisSpacing: 10.w,
        crossAxisSpacing: 10.w,

        children: navigatorList.map((item) {
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }
}

//广告栏
class AdBanner extends StatelessWidget {
  final String adPicture;

  AdBanner({Key key, this.adPicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: adPicture,
            height: 200.w,
            width: 750.w,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 4,
          ),
          Text("急，急，急，广告位招商..."),
          SizedBox(
            height: 5,
            child: Container(
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }
}

//商品推荐
class Recommend extends StatelessWidget {
  final List recommendList;

  Recommend({Key key, this.recommendList}) : super(key: key);

//  标题
  Widget _titleWidget() {
    return Container(
      height: 40,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 1, color: Colors.black12)),
      ),
      child: Text(
        "商品推荐",
        style: TextStyle(color: Colors.pink),
      ),
    );
  }

//  商品列表
  Widget _item(index) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 330.h,
        width: 250.w,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 1, color: Colors.black12),
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: "${recommendList[index].imageUrl}",
                placeholder: (context, url) => Icon(Icons.refresh),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
//                child: Image.network(
//              "${recommendList[index].imageUrl}",
//              fit: BoxFit.cover,
//            )
            ),
            Text("￥50.0"),
            Text(
              "￥100.0",
              style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.red,
                  color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

//  横向列表
  Widget _recommondList() {
    return Container(
      height: 330.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (context, index) {
          return _item(index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[_titleWidget(), _recommondList()],
      ),
    );
  }
}

//广告位  主赞助
class CollectTitle extends StatelessWidget {
  String imgStr;

  CollectTitle({this.imgStr});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      height: 200.w,
      width: 750.w,
      child: InkWell(
        onTap: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          child: CachedNetworkImage(
            imageUrl: imgStr,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

// 广告位  主赞助   商品
class CollectView extends StatelessWidget {
  final spaceLeftRight = 10.0;

  final collectList;

  CollectView({Key key, this.collectList}) : super(key: key);

//  一张图片
  Widget _titlImgWidget(imgStr, {pix = 1}) {
    return Container(
      width: 375.w - spaceLeftRight,
      height: (375.w * 3 / 4) * pix,
      child: InkWell(
        onTap: () {},
        child: CachedNetworkImage(
          imageUrl: imgStr,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

// 三张 图片
  Widget _threeImgRowWidget() {
    return Row(
      children: <Widget>[
        _titlImgWidget(collectList[1].imageUrl, pix: 2),
        Column(
          children: <Widget>[
            _titlImgWidget(collectList[2].imageUrl),
            _titlImgWidget(collectList[3].imageUrl),
          ],
        ),
      ],
    );
  }

  // 两张 图片
  Widget _twoImgRowWidget() {
    return Row(
      children: <Widget>[
        _titlImgWidget(collectList[4].imageUrl),
        _titlImgWidget(collectList[5].imageUrl),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(spaceLeftRight, 10.0, spaceLeftRight, 10.0),
      child: Column(
        children: <Widget>[
          _threeImgRowWidget(),
          _twoImgRowWidget(),
        ],
      ),
    );
  }
}
