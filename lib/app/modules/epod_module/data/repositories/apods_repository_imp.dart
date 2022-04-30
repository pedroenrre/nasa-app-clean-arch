import 'package:nasa_app/app/common/mapper/mapper.dart';
import 'package:nasa_app/app/modules/epod_module/data/datasources/local/apods_local_datasource.dart';
import 'package:nasa_app/app/modules/epod_module/data/datasources/remote/apods_remote_datasource.dart';
import 'package:nasa_app/app/modules/epod_module/data/models/apod_model.dart';
import 'package:nasa_app/app/modules/epod_module/domain/entities/apod_entity.dart';
import 'package:nasa_app/app/modules/epod_module/domain/repositories/apods_repository.dart';

class ApodsRepositoryImp implements ApodsRepository {
  final ApodsLocalDataSource _apodsLocalDataSource;
  final ApodsRemoteDataSource _apodsRemoteDataSource;
  final Mapper _mapper;

  ApodsRepositoryImp(
    this._apodsLocalDataSource,
    this._apodsRemoteDataSource,
    this._mapper,
  );
  @override
  Future<List<ApodEntity>> getApods(
      DateTime initialDate, DateTime finalDate) async {
    List<ApodEntity> list = [];
    final data = await _apodsRemoteDataSource.getApods(initialDate, finalDate);

    data.forEach((e) {
      ApodModel apod = ApodModel.fromJson(e);
      list.add(_mapper.toEntity(apod));
    });

    return list;
  }
}
