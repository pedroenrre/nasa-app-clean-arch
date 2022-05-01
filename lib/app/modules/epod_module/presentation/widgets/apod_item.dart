import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:nasa_app/app/common/resources/app_fonts.dart';
import 'package:nasa_app/app/modules/epod_module/domain/entities/apod_entity.dart';
import 'package:nasa_app/app/modules/epod_module/presentation/widgets/image_widget.dart';

class ApodItem extends StatelessWidget {
  final ApodEntity apod;
  const ApodItem({
    Key? key,
    required this.apod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.pushNamed('/details', arguments: apod);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: ImageWidget(url: apod.hdurl),
                ),
              ),
              const SizedBox(height: 10),
              Text(apod.title).emphasyText(),
              const SizedBox(height: 10),
              Text('by ${apod.copyright}').bodyText(),
              Text(
                DateFormat('dd/MM/yyyy').format(apod.date),
              ).bodyText(),
            ],
          ),
        ),
      ),
    );
  }
}
