import 'dart:developer';
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
    try {
      final data =
          await _apodsRemoteDataSource.getApods(initialDate, finalDate);

      await _apodsLocalDataSource.clearApods();

      data.forEach((e) {
        ApodModel apod = ApodModel.fromJson(e);
        _apodsLocalDataSource.insertApod(apod);
        list.add(_mapper.toEntity(apod));
      });
      log('SUCCESS API CALL >>>>>>');
    } catch (e) {
      log('ERROR >>>>>>');
      final data = await _apodsLocalDataSource.getSavedApods();
      if (data.isEmpty) throw ('No saved data');
      log('LOCAL DATA LIST>>>>>>');
      for (var e in data) {
        ApodModel apod = ApodModel.fromJson(e);
        list.add(_mapper.toEntity(apod));
      }
    }
    log('FINAL LIST>>>>>>>>');
    return list;
  }
}
