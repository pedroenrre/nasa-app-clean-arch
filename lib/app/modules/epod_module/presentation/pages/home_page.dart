import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_app/app/modules/epod_module/presentation/widgets/apod_item.dart';
import 'package:nasa_app/app/modules/epod_module/presentation/widgets/my_app_bar.dart';
import '../widgets/personal_error_widget.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  bool hasError = false;
  @override
  void initState() {
    super.initState();
    controller.getApods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Observer(builder: (_) {
        if (controller.apodsStore.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.apodsStore.hasError) {
          return PersonalError(onTryAgain: controller.getApods);
        }
        return Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: controller.apodsStore.apods.length,
            itemBuilder: (_, index) {
              return ApodItem(
                apod: controller.apodsStore.apods[index],
              );
            },
          ),
        );
      }),
    );
  }
}
