import 'package:mobx/mobx.dart';
import 'package:nasa_app/app/modules/epod_module/domain/entities/apod_entity.dart';
part 'apods_store.g.dart';

class ApodsStore = _ApodsStoreBase with _$ApodsStore;

abstract class _ApodsStoreBase with Store {
  @observable
  bool loading = true;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  bool hasError = false;

  @action
  void setHasError(bool value) => hasError = value;

  ObservableList<ApodEntity> apods = ObservableList<ApodEntity>();

  @action
  void setApodsList(List<ApodEntity> list) {
    apods.clear();
    apods = ObservableList<ApodEntity>.of(list);
  }
}
