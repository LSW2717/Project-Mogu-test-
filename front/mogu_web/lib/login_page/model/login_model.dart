import 'package:json_annotation/json_annotation.dart';
import '../../common/utils/data_utils.dart';
part 'login_model.g.dart';

abstract class LoginModelBase {}

class LoginModelError extends LoginModelBase {
  final String message;

  LoginModelError({
    required this.message,
  });
}

class LoginModelLoading extends LoginModelBase {}

@JsonSerializable()
class LoginModel extends LoginModelBase {
  final String id;
  final String username;
  @JsonKey(
    fromJson: DataUtils.pathToUrl,
  )
  final String imageUrl;

  LoginModel({
    required this.id,
    required this.username,
    required this.imageUrl,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}
