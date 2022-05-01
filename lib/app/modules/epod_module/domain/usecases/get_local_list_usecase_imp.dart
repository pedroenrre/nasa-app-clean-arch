import 'package:nasa_app/app/modules/epod_module/domain/entities/apod_entity.dart';
import 'package:nasa_app/app/modules/epod_module/domain/repositories/apods_repository.dart';
import 'package:nasa_app/app/modules/epod_module/domain/usecases/interfaces/get_local_list_usecase.dart';

class GetApodListUseCaseImp implements GetApodListUseCase {
  final ApodsRepository _apodsRepository;
  GetApodListUseCaseImp(
    this._apodsRepository,
  );
  @override
  Future<List<ApodEntity>> call(
      DateTime initialDate, DateTime finalDate) async {
    return await _apodsRepository.getApods(initialDate, finalDate);
  }
}
