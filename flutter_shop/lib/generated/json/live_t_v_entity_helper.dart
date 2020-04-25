import 'package:fluttershop/model/live_t_v_entity.dart';

liveTVEntityFromJson(LiveTVEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['message'] != null) {
		data.message = json['message']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<LiveTVData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new LiveTVData().fromJson(v));
		});
	}
	if (json['extendInfo'] != null) {
		data.extendInfo = new LiveTVExtendInfo().fromJson(json['extendInfo']);
	}
	return data;
}

Map<String, dynamic> liveTVEntityToJson(LiveTVEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['message'] = entity.message;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	if (entity.extendInfo != null) {
		data['extendInfo'] = entity.extendInfo.toJson();
	}
	return data;
}

liveTVDataFromJson(LiveTVData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['serv'] != null) {
		data.serv = json['serv']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['icon'] != null) {
		data.icon = json['icon']?.toInt();
	}
	if (json['biz'] != null) {
		data.biz = json['biz']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['selected'] != null) {
		data.selected = json['selected']?.toInt();
	}
	if (json['pic'] != null) {
		data.pic = json['pic']?.toString();
	}
	if (json['navs'] != null) {
		data.navs = new List<LiveTVDataNav>();
		(json['navs'] as List).forEach((v) {
			data.navs.add(new LiveTVDataNav().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> liveTVDataToJson(LiveTVData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['serv'] = entity.serv;
	data['name'] = entity.name;
	data['icon'] = entity.icon;
	data['biz'] = entity.biz;
	data['url'] = entity.url;
	data['selected'] = entity.selected;
	data['pic'] = entity.pic;
	if (entity.navs != null) {
		data['navs'] =  entity.navs.map((v) => v.toJson()).toList();
	}
	return data;
}

liveTVDataNavFromJson(LiveTVDataNav data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['serv'] != null) {
		data.serv = json['serv']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['biz'] != null) {
		data.biz = json['biz']?.toString();
	}
	if (json['selected'] != null) {
		data.selected = json['selected']?.toInt();
	}
	if (json['pic'] != null) {
		data.pic = json['pic']?.toString();
	}
	return data;
}

Map<String, dynamic> liveTVDataNavToJson(LiveTVDataNav entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['serv'] = entity.serv;
	data['name'] = entity.name;
	data['biz'] = entity.biz;
	data['selected'] = entity.selected;
	data['pic'] = entity.pic;
	return data;
}

liveTVExtendInfoFromJson(LiveTVExtendInfo data, Map<String, dynamic> json) {
	if (json['slideHide'] != null) {
		data.slideHide = json['slideHide']?.toInt();
	}
	if (json['isTop'] != null) {
		data.isTop = json['isTop']?.toInt();
	}
	if (json['testGroup'] != null) {
		data.testGroup = json['testGroup']?.toInt();
	}
	if (json['testId'] != null) {
		data.testId = json['testId']?.toString();
	}
	return data;
}

Map<String, dynamic> liveTVExtendInfoToJson(LiveTVExtendInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['slideHide'] = entity.slideHide;
	data['isTop'] = entity.isTop;
	data['testGroup'] = entity.testGroup;
	data['testId'] = entity.testId;
	return data;
}