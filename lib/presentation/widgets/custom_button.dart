import 'package:flutter/material.dart';
import 'package:smart_sale_boss/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final bool isLoading;
  final bool isSeeNextIcon;
  final String title;
  final IconData? icon;
  final String? iconSvg;
  final VoidCallback? onTap;
  final TextStyle? style;

  const CustomButton(
      {super.key,
      this.height,
      this.isLoading = false,
      this.isSeeNextIcon = false,
      required this.title,
      this.icon,
      this.iconSvg,
      this.onTap,
      this.style});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onTap,
      style: ElevatedButton.styleFrom(
        maximumSize: Size(double.infinity, height ?? 48),
        minimumSize: Size(double.infinity, height ?? 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: isLoading
          ? const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                color: AppColors.white,
                strokeWidth: 3,
              ),
            )
          : Text(
              title,
              style: style ??
                  const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
            ),
    );
  }
}
