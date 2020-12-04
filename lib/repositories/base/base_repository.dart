import 'package:dio/dio.dart';
import 'package:spacex/view/src/app.dart';

abstract class BaseRepository {
  Future<dynamic> catchError(Object obj) async {
    switch (obj.runtimeType) {
      case DioError:
        final res = (obj as DioError).response;
        logger.e("Got error : ${res.statusCode} -> ${res.statusMessage}");
        break;
      default:
    }
  }
}