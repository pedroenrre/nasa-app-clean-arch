import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return hasError
        ? PersonalError(onTryAgain: () {})
        : const Center(
            child: Text('Home'),
          );
  }
}
