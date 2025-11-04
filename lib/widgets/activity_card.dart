import 'package:flutter/material.dart';
import 'package:mango_sort/theme/colors.dart';

class ActivityCard extends StatelessWidget {
  final String emoji;
  final String title;
  final String time;
  final Color color;
  final Color borderColor;

  const ActivityCard({
    super.key,
    required this.emoji,
    required this.title,
    required this.time,
    required this.color,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border(left: BorderSide(color: borderColor, width: 4)),
        boxShadow: [
          BoxShadow(
            color: AppColors.hitam.withOpacity(0.15),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.hitam,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: AppColors.hitam,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> selectDate({
  required BuildContext context,
  required TextEditingController controller,
  required Function() refreshUI,
}) async {
  DateTime now = DateTime.now();
  DateTime? picked = await showDatePicker(
    context: context,
    initialDate: now,
    firstDate: DateTime(2020),
    lastDate: DateTime(2100),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppColors.hijau, 
            onPrimary: Colors.white,
            onSurface: AppColors.hitam, 
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.hijau, // Warna tombol CANCEL / OK
            ),
          ),
        ),
        child: child!,
      );
    },
  );

  if (picked != null) {
    controller.text =
        "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
    refreshUI();
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.hijau : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: AppColors.hijau,
            width: 2,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : AppColors.hijau,
          ),
        ),
      ),
    );
  }
}

