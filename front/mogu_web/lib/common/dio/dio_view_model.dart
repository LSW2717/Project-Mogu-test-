import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'dio_view_model.g.dart';

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) {
  return Dio();
}
