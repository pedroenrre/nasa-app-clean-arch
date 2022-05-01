import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'modules/epod_module/apod_module.dart';
import 'api.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<Dio>((i) => api),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/',
          module: ApodModule(),
          // guards: [HomeGuard()],
        ),
      ];
}

class HomeGuard extends RouteGuard {
  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    await Modular.isModuleReady<AppModule>();
    return true;
  }
}
