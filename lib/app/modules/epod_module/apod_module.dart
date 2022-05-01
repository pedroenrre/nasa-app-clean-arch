import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_app/app/common/mapper/mapper.dart';
import 'package:nasa_app/app/modules/epod_module/data/datasources/local/apods_local_datasource.dart';
import 'package:nasa_app/app/modules/epod_module/data/datasources/remote/apods_remote_datasource.dart';
import 'package:nasa_app/app/modules/epod_module/data/mappers/apod_mapper.dart';
import 'package:nasa_app/app/modules/epod_module/data/repositories/apods_repository_imp.dart';
import 'package:nasa_app/app/modules/epod_module/domain/repositories/apods_repository.dart';
import 'package:nasa_app/app/modules/epod_module/domain/usecases/get_local_list_usecase_imp.dart';
import 'package:nasa_app/app/modules/epod_module/presentation/pages/details_page.dart';
import 'package:nasa_app/app/modules/epod_module/presentation/stores/apods_store.dart';
import 'domain/usecases/interfaces/get_local_list_usecase.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/controllers/home_controller.dart';
import '../../api.dart';

class ApodModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<Dio>((i) => api),

        // STORES
        Bind.singleton((i) => ApodsStore()),

        // MAPPERS
        Bind.factory(
          <Mapper>(i) => ApodMapper(),
        ),

        // DATASOURCES
        Bind.factory(
          (i) => ApodsLocalDataSource(),
        ),
        Bind.factory(
          (i) => ApodsRemoteDataSource(i<Dio>()),
        ),

        // REPOSITORIES
        Bind.factory(
          (i) => ApodsRepositoryImp(
            i<ApodsLocalDataSource>(),
            i<ApodsRemoteDataSource>(),
            i<Mapper>(),
          ),
        ),

        //USECASES
        Bind.factory(
          (i) => GetApodListUseCaseImp(i<ApodsRepository>()),
        ),

        // CONTROLLERS
        Bind.factory(
          (i) => HomeController(
            i<ApodsStore>(),
            i<GetApodListUseCase>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          transition: TransitionType.fadeIn,
          child: (context, args) => const HomePage(),
        ),
        ChildRoute(
          '/details',
          transition: TransitionType.fadeIn,
          child: (context, args) => DetailsPage(item: args.data),
        ),
      ];
}
