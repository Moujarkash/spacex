import 'package:dio/dio.dart';
import 'package:spacex/view/src/app.dart';

abstract class BaseRepository {
  void catchError(Object obj) {
    switch (obj.runtimeType) {
      case DioError:
        final res = (obj as DioError).response;
        logger.e("Got error : ${res.statusCode} -> ${res.statusMessage}");
        break;
      default:
    }
  }
}