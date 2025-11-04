import 'package:flutter/material.dart';
import 'package:mango_sort/theme/colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: AppColors.putih,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: AppColors.hitam.withOpacity(0.15),
            blurRadius: 14,
            offset: const Offset(0, -2),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(5, (index) {
          bool isActive = currentIndex == index;
          return GestureDetector(
            onTap: () => onTap(index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ✅ Garis hijau di atas icon
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 4,
                  width: 28,
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.hijau : Colors.transparent,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),

                const SizedBox(height: 6),

                Icon(
                  _getIcon(index),
                  size: 26,
                  color: isActive
                      ? AppColors.hijau
                      : AppColors.abuabumuda,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  IconData _getIcon(int index) {
    switch (index) {
      case 0:
        return Icons.home_rounded;
      case 1:
        return Icons.monitor_heart_rounded;
      case 2:
        return Icons.bar_chart_rounded;
      case 3:
        return Icons.article_rounded;
      case 4:
        return Icons.settings_rounded;
      default:
        return Icons.home_rounded;
    }
  }
}
