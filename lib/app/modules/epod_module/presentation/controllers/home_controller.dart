import 'package:nasa_app/app/modules/epod_module/domain/usecases/interfaces/get_local_list_usecase.dart';
import 'package:nasa_app/app/modules/epod_module/presentation/stores/apods_store.dart';

class HomeController {
  final ApodsStore apodsStore;
  final GetApodListUseCase _getApodListUseCase;

  HomeController(
    this.apodsStore,
    this._getApodListUseCase,
  );

  Future<void> getApods() async {
    apodsStore.setLoading(true);
    apodsStore.setHasError(false);
    try {
      final resp = await _getApodListUseCase(
          DateTime.parse('2022-04-01'), DateTime.now());
      apodsStore.setApodsList(resp);
    } catch (e) {
      apodsStore.setHasError(true);
      // rethrow;
    } finally {
      apodsStore.setLoading(false);
    }
  }
}
