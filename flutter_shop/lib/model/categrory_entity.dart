import 'package:fluttershop/generated/json/base/json_convert_content.dart';
import 'package:fluttershop/generated/json/base/json_filed.dart';

class CategroryEntity with JsonConvert<CategroryEntity> {
	CategroryData data;
	int status;
	String message;
}

class CategroryData with JsonConvert<CategroryData> {
	List<CategroryDataChannel> channel;
}

class CategroryDataChannel with JsonConvert<CategroryDataChannel> {
	int id;
	int status;
	String color;
	String icon;
	String name;
	@JSONField(name: "is_default")
	bool isDefault;
	@JSONField(name: "is_fixed")
	bool isFixed;
	@JSONField(name: "op_mark_type")
	String opMarkType;
	@JSONField(name: "op_mark")
	String opMark;
	@JSONField(name: "op_mark_stm")
	int opMarkStm;
	@JSONField(name: "op_mark_etm")
	int opMarkEtm;
	@JSONField(name: "force_insert")
	bool forceInsert;
	@JSONField(name: "force_insert_time")
	int forceInsertTime;
	@JSONField(name: "publish_strategy")
	int publishStrategy;
	@JSONField(name: "sub_channels")
	List<dynamic> subChannels;
	List<dynamic> bubbles;
	@JSONField(name: "sub_channel_style")
	int subChannelStyle;
	@JSONField(name: "guide_mark_type")
	int guideMarkType;
	@JSONField(name: "guide_mark_val")
	String guideMarkVal;
	@JSONField(name: "guide_mark_timestamp")
	int guideMarkTimestamp;
	@JSONField(name: "repeat_count")
	int repeatCount;
	@JSONField(name: "is_subscribed")
	bool isSubscribed;
}

