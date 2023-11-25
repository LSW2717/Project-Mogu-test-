import '../../common/utils/data_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contest_model.g.dart';

@JsonSerializable()
class ContestModel {
  final int id;
  final String name;
  final String category;
  @JsonKey(
      fromJson: DataUtils.stringToDateTime
  )
  final DateTime endDate;
  final String url;
  final String imgUrl;

  ContestModel({
    required this.id,
    required this.name,
    required this.category,
    required this.endDate,
    required this.url,
    required this.imgUrl
  });

  factory ContestModel.fromJson(Map<String, dynamic> json) =>
      _$ContestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContestModelToJson(this);
}
