import 'package:nasa_app/app/modules/epod_module/domain/entities/apod_entity.dart';

abstract class ApodsRepository {
  Future<List<ApodEntity>> getApods(DateTime initialDate, DateTime finalDate);
}
