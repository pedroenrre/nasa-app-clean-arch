// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apods_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ApodsStore on _ApodsStoreBase, Store {
  late final _$loadingAtom =
      Atom(name: '_ApodsStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$hasErrorAtom =
      Atom(name: '_ApodsStoreBase.hasError', context: context);

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  late final _$_ApodsStoreBaseActionController =
      ActionController(name: '_ApodsStoreBase', context: context);

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_ApodsStoreBaseActionController.startAction(
        name: '_ApodsStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_ApodsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHasError(bool value) {
    final _$actionInfo = _$_ApodsStoreBaseActionController.startAction(
        name: '_ApodsStoreBase.setHasError');
    try {
      return super.setHasError(value);
    } finally {
      _$_ApodsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setApodsList(List<ApodEntity> list) {
    final _$actionInfo = _$_ApodsStoreBaseActionController.startAction(
        name: '_ApodsStoreBase.setApodsList');
    try {
      return super.setApodsList(list);
    } finally {
      _$_ApodsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
hasError: ${hasError}
    ''';
  }
}
