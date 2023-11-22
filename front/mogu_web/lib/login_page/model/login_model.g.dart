// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      id: json['id'] as String,
      username: json['username'] as String,
      imageUrl: DataUtils.pathToUrl(json['imageUrl'] as String),
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'imageUrl': instance.imageUrl,
    };
