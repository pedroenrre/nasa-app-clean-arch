import 'package:nasa_app/app/modules/epod_module/domain/entities/apod_entity.dart';

abstract class GetApodListUseCase {
  Future<List<ApodEntity>> call(
    DateTime initialDate,
    DateTime finalDate,
  );
}
