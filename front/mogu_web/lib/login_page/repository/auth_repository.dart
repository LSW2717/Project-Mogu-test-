import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../common/const/data.dart';
import '../../common/dio/dio_view_model.dart';
import '../../common/model/token_response.dart';
import '../model/login_response_model.dart';
part 'auth_repository.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
final dio = ref.watch(dioProvider);
return AuthRepository(dio, baseUrl: 'http://$ip/api/auth');
}

@RestApi()
abstract class AuthRepository {
  factory AuthRepository(Dio dio, {String baseUrl}) = _AuthRepository;

  @POST("/login")
  Future<LoginResponse> login(@Field("username") String username, @Field("password") String password);

  @POST("/refreshToken")
  Future<TokenResponse> token(@Header("refreshToken") String refreshToken);

  @POST("/logout")
  Future<void> logout(@Field("userId") int userId);
}
