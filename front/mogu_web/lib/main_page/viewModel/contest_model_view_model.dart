import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mogu_web/main_page/model/contest_model.dart';
import '../repository/contest_repository.dart';
part 'contest_model_view_model.g.dart';

@Riverpod(keepAlive: true)
Future<List<ContestModel>> contestModel(ContestModelRef ref) async {
  try {
    final api = ref.watch(contestRepositoryProvider);
    final response = await api.getContestInfo();
    final List<dynamic> contestsData = (response as Map<String, dynamic>)['data'];
    return contestsData
        .map((e) => ContestModel.fromJson(e as Map<String, dynamic>))
        .toList();
  } catch (e) {
    print('API 요청 중 오류 발생: $e');
    throw e;
  }
}
