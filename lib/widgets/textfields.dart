import 'package:flutter/material.dart';
import 'package:mango_sort/theme/colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  // final String hint;
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback? onToggleVisibility;
  final bool hasVisibilityToggle;

  const CustomTextField({
    super.key,
    required this.label,
    // required this.hint,
    required this.controller,
    this.obscureText = false,
    this.onToggleVisibility,
    this.hasVisibilityToggle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w100,
            fontSize: 13,
          ),
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          cursorColor: AppColors.hitam,
          decoration: InputDecoration(
            // hintText: hint,
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.hitam, 
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.hitam, // ubah sesuai warna kamu
                width: 2.0,
              ),
            ),
            suffixIcon: hasVisibilityToggle
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.abuabu,
                    ),
                    onPressed: onToggleVisibility,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
