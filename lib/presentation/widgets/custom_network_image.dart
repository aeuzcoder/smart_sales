import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smart_sale_boss/core/utils/app_colors.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? path;
  final double? height;
  final double? width;
  final BoxConstraints? constraints;
  final BoxFit? fit;
  final BorderRadiusGeometry? borderRadius;

  const CustomNetworkImage({
    super.key,
    required this.path,
    this.height,
    this.width,
    this.constraints,
    this.fit,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: 'https://investdev.uz$path',
      imageBuilder: (context, imageProvider) {
        return Container(
          height: height,
          width: width,
          alignment: Alignment.topLeft,
          constraints: constraints,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        );
      },
      placeholder: (context, url) {
        return Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: AppColors.blvk05,
          ),
          child: const CircularProgressIndicator(),
        );
      },
      errorWidget: (context, url, error) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: AppColors.blvk05,
          ),
        );
      },
    );
  }
}
