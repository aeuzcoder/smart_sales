import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smart_sale_boss/core/services/utils_service.dart';
import 'package:smart_sale_boss/core/utils/app_colors.dart';

class DailyCard extends StatelessWidget {
  final int index;
  final String title;
  final int price;
  final bool isShimmer;

  const DailyCard({
    super.key,
    required this.index,
    required this.title,
    required this.price,
    this.isShimmer = false,
  });

  @override
  Widget build(BuildContext context) {
    return isShimmer ? _shimmerWidget() : _baseWidget();
  }

  Widget _baseWidget() {
    return Container(
      height: 58,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, 0),
            // ignore: deprecated_member_use
            color: AppColors.n979C9E.withOpacity(0.1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            decoration: BoxDecoration(
              color: getRandomColor(index),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF5A5A5A),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '${Utils.formattingPrice(price)} UZS',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _shimmerWidget() {
    return Shimmer.fromColors(
      period: const Duration(seconds: 3),
      baseColor: AppColors.baseColor,
      highlightColor: AppColors.highlightedColor,
      child: Container(
        height: 58,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 5,
              offset: const Offset(0, 0),
              // ignore: deprecated_member_use
              color: AppColors.n979C9E.withOpacity(0.1),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 4,
              decoration: BoxDecoration(
                color: getRandomColor(index),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF5A5A5A),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '${Utils.formattingPrice(price)} UZS',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Function to generate a random color
  Color getRandomColor(int index) {
    const primaries = Colors.primaries;
    if (index < primaries.length) return primaries[index];
    final Random random = Random();
    return Color.fromARGB(
      255, // Alpha (opacity) set to 255 (fully opaque)
      random.nextInt(256), // Red (0-255)
      random.nextInt(256), // Green (0-255)
      random.nextInt(256), // Blue (0-255)
    );
  }
}
