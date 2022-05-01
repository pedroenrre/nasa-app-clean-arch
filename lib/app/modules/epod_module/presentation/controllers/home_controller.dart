import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:nasa_app/app/modules/epod_module/domain/usecases/interfaces/get_local_list_usecase.dart';
import 'package:nasa_app/app/modules/epod_module/presentation/stores/apods_store.dart';

class HomeController {
  final ApodsStore apodsStore;
  final GetApodListUseCase _getApodListUseCase;

  final TextEditingController initDateController = TextEditingController();
  final TextEditingController finalDateController = TextEditingController();

  DateTime _initDate = DateTime.now().subtract(const Duration(days: 30));
  DateTime _finalDate = DateTime.now();

  HomeController(
    this.apodsStore,
    this._getApodListUseCase,
  ) {
    initDateController.text = DateFormat('dd/MM/yyyy').format(_initDate);
    finalDateController.text = DateFormat('dd/MM/yyyy').format(_finalDate);
  }

  Future<void> getApods() async {
    apodsStore.setLoading(true);
    apodsStore.setHasError(false);
    try {
      _initDate = _getDateFromText(initDateController.text);
      _finalDate = _getDateFromText(finalDateController.text);
      final resp = await _getApodListUseCase(_initDate, _finalDate);
      apodsStore.setApodsList(resp);
    } catch (e) {
      apodsStore.setHasError(true);
      // rethrow;
    } finally {
      apodsStore.setLoading(false);
    }
  }

  DateTime _getDateFromText(String value) {
    List<String> dateSpliting = value.split('/');
    return DateTime.parse(dateSpliting[2] + dateSpliting[1] + dateSpliting[0]);
  }
}
