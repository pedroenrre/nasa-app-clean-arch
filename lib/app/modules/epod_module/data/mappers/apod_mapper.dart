import 'package:nasa_app/app/modules/epod_module/data/models/apod_model.dart';
import 'package:nasa_app/app/modules/epod_module/domain/entities/apod_entity.dart';
import '../../../../common/mapper/mapper.dart';

class ApodMapper implements Mapper<ApodEntity, ApodModel> {
  @override
  fromEntity(object) {
    // TODO: implement fromEntity
    throw UnimplementedError();
  }

  @override
  toEntity(ApodModel object) => ApodEntity(
        copyright: object.copyright ?? '',
        date: DateTime.parse(object.date!),
        hdurl: object.hdurl ?? '',
        title: object.title ?? '',
      );
}
