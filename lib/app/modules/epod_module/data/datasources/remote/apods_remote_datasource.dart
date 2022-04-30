import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:nasa_app/app/common/resources/api_key.dart';

class ApodsRemoteDataSource {
  final Dio dio;

  ApodsRemoteDataSource(this.dio);

  Future getApods(DateTime initialDate, DateTime finalDate) async {
    print(DateFormat('yyyy-MMdd').format(initialDate));
    try {
      final response = await dio.get('apod', queryParameters: {
        'start_date': DateFormat('yyyy-MM-dd').format(initialDate),
        'end_date': DateFormat('yyyy-MM-dd').format(finalDate),
        'api_key': apiKey,
      });
      return response.data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
