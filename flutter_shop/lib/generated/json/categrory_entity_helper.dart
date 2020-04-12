import 'package:fluttershop/model/categrory_entity.dart';

categroryEntityFromJson(CategroryEntity data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = new CategroryData().fromJson(json['data']);
	}
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['message'] != null) {
		data.message = json['message']?.toString();
	}
	return data;
}

Map<String, dynamic> categroryEntityToJson(CategroryEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	data['status'] = entity.status;
	data['message'] = entity.message;
	return data;
}

categroryDataFromJson(CategroryData data, Map<String, dynamic> json) {
	if (json['channel'] != null) {
		data.channel = new List<CategroryDataChannel>();
		(json['channel'] as List).forEach((v) {
			data.channel.add(new CategroryDataChannel().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> categroryDataToJson(CategroryData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.channel != null) {
		data['channel'] =  entity.channel.map((v) => v.toJson()).toList();
	}
	return data;
}

categroryDataChannelFromJson(CategroryDataChannel data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['color'] != null) {
		data.color = json['color']?.toString();
	}
	if (json['icon'] != null) {
		data.icon = json['icon']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['is_default'] != null) {
		data.isDefault = json['is_default'];
	}
	if (json['is_fixed'] != null) {
		data.isFixed = json['is_fixed'];
	}
	if (json['op_mark_type'] != null) {
		data.opMarkType = json['op_mark_type']?.toString();
	}
	if (json['op_mark'] != null) {
		data.opMark = json['op_mark']?.toString();
	}
	if (json['op_mark_stm'] != null) {
		data.opMarkStm = json['op_mark_stm']?.toInt();
	}
	if (json['op_mark_etm'] != null) {
		data.opMarkEtm = json['op_mark_etm']?.toInt();
	}
	if (json['force_insert'] != null) {
		data.forceInsert = json['force_insert'];
	}
	if (json['force_insert_time'] != null) {
		data.forceInsertTime = json['force_insert_time']?.toInt();
	}
	if (json['publish_strategy'] != null) {
		data.publishStrategy = json['publish_strategy']?.toInt();
	}
	if (json['sub_channels'] != null) {
		data.subChannels = new List<dynamic>();
		data.subChannels.addAll(json['sub_channels']);
	}
	if (json['bubbles'] != null) {
		data.bubbles = new List<dynamic>();
		data.bubbles.addAll(json['bubbles']);
	}
	if (json['sub_channel_style'] != null) {
		data.subChannelStyle = json['sub_channel_style']?.toInt();
	}
	if (json['guide_mark_type'] != null) {
		data.guideMarkType = json['guide_mark_type']?.toInt();
	}
	if (json['guide_mark_val'] != null) {
		data.guideMarkVal = json['guide_mark_val']?.toString();
	}
	if (json['guide_mark_timestamp'] != null) {
		data.guideMarkTimestamp = json['guide_mark_timestamp']?.toInt();
	}
	if (json['repeat_count'] != null) {
		data.repeatCount = json['repeat_count']?.toInt();
	}
	if (json['is_subscribed'] != null) {
		data.isSubscribed = json['is_subscribed'];
	}
	return data;
}

Map<String, dynamic> categroryDataChannelToJson(CategroryDataChannel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['status'] = entity.status;
	data['color'] = entity.color;
	data['icon'] = entity.icon;
	data['name'] = entity.name;
	data['is_default'] = entity.isDefault;
	data['is_fixed'] = entity.isFixed;
	data['op_mark_type'] = entity.opMarkType;
	data['op_mark'] = entity.opMark;
	data['op_mark_stm'] = entity.opMarkStm;
	data['op_mark_etm'] = entity.opMarkEtm;
	data['force_insert'] = entity.forceInsert;
	data['force_insert_time'] = entity.forceInsertTime;
	data['publish_strategy'] = entity.publishStrategy;
	if (entity.subChannels != null) {
		data['sub_channels'] =  [];
	}
	if (entity.bubbles != null) {
		data['bubbles'] =  [];
	}
	data['sub_channel_style'] = entity.subChannelStyle;
	data['guide_mark_type'] = entity.guideMarkType;
	data['guide_mark_val'] = entity.guideMarkVal;
	data['guide_mark_timestamp'] = entity.guideMarkTimestamp;
	data['repeat_count'] = entity.repeatCount;
	data['is_subscribed'] = entity.isSubscribed;
	return data;
}