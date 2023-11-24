import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../common/const/data.dart';
import '../../common/dio/dio_view_model.dart';
part 'signup_repository.g.dart';


@Riverpod(keepAlive: true)
SignupRepository signupRepository(SignupRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return SignupRepository(dio, baseUrl: 'http://$ip/api/auth');
}

@RestApi()
abstract class SignupRepository {
  factory SignupRepository(Dio dio, {String baseUrl}) = _SignupRepository;

  @POST("/signup")
  Future<void> signup(@Field("name") String name, @Field("username") String username, @Field("password") String password, @Field("email") String email);

}
