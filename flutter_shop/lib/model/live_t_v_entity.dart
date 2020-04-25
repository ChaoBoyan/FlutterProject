import 'package:fluttershop/generated/json/base/json_convert_content.dart';

class LiveTVEntity with JsonConvert<LiveTVEntity> {
	int code;
	String message;
	List<LiveTVData> data;
	LiveTVExtendInfo extendInfo;
}

class LiveTVData with JsonConvert<LiveTVData> {
	int id;
	int serv;
	String name;
	int icon;
	String biz;
	String url;
	int selected;
	String pic;
	List<LiveTVDataNav> navs;
}

class LiveTVDataNav with JsonConvert<LiveTVDataNav> {
	int id;
	int serv;
	String name;
	String biz;
	int selected;
	String pic;
}

class LiveTVExtendInfo with JsonConvert<LiveTVExtendInfo> {
	int slideHide;
	int isTop;
	int testGroup;
	String testId;
}
