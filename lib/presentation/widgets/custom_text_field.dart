import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_sale_boss/core/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextInputFormatter? formatter;
  final String? hintText;
  final Function(String value)? onChange;
  final VoidCallback? onSuffixIcons;
  final String? Function(String?)? validator;

  const CustomTextField(
      {super.key,
      required this.controller,
      this.suffix,
      this.keyboardType,
      this.obscureText = false,
      this.formatter,
      this.hintText,
      this.onChange,
      this.onSuffixIcons,
      this.validator});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 1, color: Color(0xFFEDF0F4)),
    );

    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    );

    return TextFormField(
      onChanged: onChange,
      inputFormatters: formatter != null ? [formatter!] : null,
      obscuringCharacter: "*",
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      style: const TextStyle(
          fontWeight: FontWeight.w500, fontSize: 14, color: AppColors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: AppColors.blvk03,
        ),
        suffixIcon: onSuffixIcons == null
            ? null
            : IconButton(
                onPressed: onSuffixIcons,
                icon: Icon(
                  obscureText
                      ? CupertinoIcons.eye_fill
                      : CupertinoIcons.eye_slash_fill,
                  size: 20,
                  color: const Color(0xFF84919A),
                ),
              ),
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
      ),
      validator: validator ?? val,
    );
  }

  String? val(String? value) {
    if (value == null || value.isEmpty) {
      return 'Maydon bo\'sh';
    }
    return null;
  }
}
