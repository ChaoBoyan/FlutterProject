// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:fluttershop/model/live_t_v_entity.dart';
import 'package:fluttershop/generated/json/live_t_v_entity_helper.dart';
import 'package:fluttershop/model/categrory_entity.dart';
import 'package:fluttershop/generated/json/categrory_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {			case LiveTVEntity:
			return liveTVEntityFromJson(data as LiveTVEntity, json) as T;			case LiveTVData:
			return liveTVDataFromJson(data as LiveTVData, json) as T;			case LiveTVDataNav:
			return liveTVDataNavFromJson(data as LiveTVDataNav, json) as T;			case LiveTVExtendInfo:
			return liveTVExtendInfoFromJson(data as LiveTVExtendInfo, json) as T;			case CategroryEntity:
			return categroryEntityFromJson(data as CategroryEntity, json) as T;			case CategroryData:
			return categroryDataFromJson(data as CategroryData, json) as T;			case CategroryDataChannel:
			return categroryDataChannelFromJson(data as CategroryDataChannel, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {			case LiveTVEntity:
			return liveTVEntityToJson(data as LiveTVEntity);			case LiveTVData:
			return liveTVDataToJson(data as LiveTVData);			case LiveTVDataNav:
			return liveTVDataNavToJson(data as LiveTVDataNav);			case LiveTVExtendInfo:
			return liveTVExtendInfoToJson(data as LiveTVExtendInfo);			case CategroryEntity:
			return categroryEntityToJson(data as CategroryEntity);			case CategroryData:
			return categroryDataToJson(data as CategroryData);			case CategroryDataChannel:
			return categroryDataChannelToJson(data as CategroryDataChannel);    }
    return data as T;
  }
  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {			case 'LiveTVEntity':
			return LiveTVEntity().fromJson(json);			case 'LiveTVData':
			return LiveTVData().fromJson(json);			case 'LiveTVDataNav':
			return LiveTVDataNav().fromJson(json);			case 'LiveTVExtendInfo':
			return LiveTVExtendInfo().fromJson(json);			case 'CategroryEntity':
			return CategroryEntity().fromJson(json);			case 'CategroryData':
			return CategroryData().fromJson(json);			case 'CategroryDataChannel':
			return CategroryDataChannel().fromJson(json);    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {			case 'LiveTVEntity':
			return List<LiveTVEntity>();			case 'LiveTVData':
			return List<LiveTVData>();			case 'LiveTVDataNav':
			return List<LiveTVDataNav>();			case 'LiveTVExtendInfo':
			return List<LiveTVExtendInfo>();			case 'CategroryEntity':
			return List<CategroryEntity>();			case 'CategroryData':
			return List<CategroryData>();			case 'CategroryDataChannel':
			return List<CategroryDataChannel>();    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}