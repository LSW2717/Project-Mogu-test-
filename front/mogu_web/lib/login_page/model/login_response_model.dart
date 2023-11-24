import 'package:json_annotation/json_annotation.dart';
part 'login_response_model.g.dart';



@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'refreshToken')
  final String refreshToken;

  @JsonKey(name: 'token')
  final String accessToken;

  final int id;
  final String name;
  final String username;
  final String email;
  final List<String> roles;

  LoginResponse({
    required this.refreshToken,
    required this.accessToken,
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.roles,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}
