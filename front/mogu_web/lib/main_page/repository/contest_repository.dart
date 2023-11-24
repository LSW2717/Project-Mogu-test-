import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../common/const/data.dart';
import '../../common/dio/dio_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'contest_repository.g.dart';

@Riverpod(keepAlive: true)
ContestRepository contestRepository(ContestRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return ContestRepository(dio, baseUrl: 'http://$ip/api/contest');
}
@RestApi()
abstract class ContestRepository {
  factory ContestRepository(Dio dio, {String baseUrl}) = _ContestRepository;

  @GET('/info')
  Future<dynamic> getContestInfo();
}
