import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nasa_app/app/common/resources/app_colors.dart';
import 'package:nasa_app/app/common/resources/app_fonts.dart';

import 'package:nasa_app/app/modules/epod_module/domain/entities/apod_entity.dart';
import 'package:nasa_app/app/modules/epod_module/presentation/widgets/image_widget.dart';
import 'package:nasa_app/app/modules/epod_module/presentation/widgets/my_app_bar.dart';

class DetailsPage extends StatelessWidget {
  final ApodEntity item;
  const DetailsPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(label: 'Apod details'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: ImageWidget(url: item.hdurl),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              item.title,
              textAlign: TextAlign.center,
            ).emphasyText(),
            const SizedBox(height: 10),
            Text(
              'by ${item.copyright}',
              textAlign: TextAlign.center,
            ).bodyText(),
            Text(
              DateFormat('dd/MM/yyyy').format(item.date),
              textAlign: TextAlign.center,
            ).bodyText(),
            const SizedBox(height: 20),
            const Text(
              'Description:',
            ).emphasyText(),
            const SizedBox(height: 10),
            Text(
              item.description,
            ).bodyText(),
          ],
        ),
      ),
    );
  }
}
