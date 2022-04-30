import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/controllers/home_controller.dart';

class ApodModule extends Module {
  @override
  List<Bind> get binds => [
        // DATABASES

        // REPOSITORIES

        //USECASES

        // CONTROLLERS
        Bind.factory(
          (i) => HomeController(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          transition: TransitionType.fadeIn,
          // child: (context, args) => const JourneyHome(),
          child: (context, args) => const HomePage(),
        ),
      ];
}
