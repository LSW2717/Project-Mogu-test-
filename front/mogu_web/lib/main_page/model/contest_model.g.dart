// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contest_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContestModel _$ContestModelFromJson(Map<String, dynamic> json) => ContestModel(
      id: json['id'] as int,
      name: json['name'] as String,
      category: json['category'] as String,
      endDate: DataUtils.stringToDateTime(json['endDate'] as String),
      url: json['url'] as String,
      imgUrl: json['imgUrl'] as String,
    );

Map<String, dynamic> _$ContestModelToJson(ContestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'endDate': instance.endDate.toIso8601String(),
      'url': instance.url,
      'imgUrl': instance.imgUrl,
    };
