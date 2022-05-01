import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:nasa_app/app/common/resources/app_colors.dart';
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
  var maskFormatter = MaskTextInputFormatter(mask: '##/##/####');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
              if (index == 0) {
                return Column(
                  children: [
                    _buildDateInputs(context),
                    const SizedBox(height: 16),
                    ApodItem(
                      apod: controller.apodsStore.apods[index],
                    ),
                  ],
                );
              }
              return ApodItem(
                apod: controller.apodsStore.apods[index],
              );
            },
          ),
        );
      }),
    );
  }

  Widget _buildDateInputs(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Row(
          children: [
            Flexible(
              child: TextFormField(
                controller: controller.initDateController,
                decoration: const InputDecoration(
                  labelText: "Initial date",
                  counterText: '',
                ),
                keyboardType: TextInputType.number,
                maxLength: 10,
                inputFormatters: [maskFormatter],
                validator: (value) {
                  if (value == null || value.length < 10) return 'Invalid date';
                  return null;
                },
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: TextFormField(
                controller: controller.finalDateController,
                decoration: const InputDecoration(
                  labelText: "Final date",
                  counterText: '',
                ),
                keyboardType: TextInputType.number,
                maxLength: 10,
                inputFormatters: [maskFormatter],
                validator: (value) {
                  if (value == null || value.length < 10) return 'Invalid date';
                  return null;
                },
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              height: 58,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (states) => AppColors.primary),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    controller.getApods();
                  }
                },
                child: const Icon(Icons.search),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
