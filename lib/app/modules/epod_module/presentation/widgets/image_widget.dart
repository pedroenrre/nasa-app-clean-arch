import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:nasa_app/app/common/resources/app_colors.dart';
import 'package:nasa_app/app/common/resources/app_fonts.dart';

class ImageWidget extends StatelessWidget {
  final String url;
  const ImageWidget({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: AppColors.grey,
        highlightColor: AppColors.white,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        color: AppColors.grey,
        constraints: const BoxConstraints(minHeight: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 40),
            const SizedBox(height: 10),
            const Text('Sorry!').emphasyText(),
            const SizedBox(height: 10),
            const Text(
              'We could not load this image. Check your network connection and try to load the page again.',
              textAlign: TextAlign.center,
            ).bodyText(),
          ],
        ),
      ),
    );
  }
}
