import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mango_sort/theme/colors.dart';

class MangoPieChart extends StatelessWidget {
  final int sehat;
  final int busuk;

  const MangoPieChart({super.key, required this.sehat, required this.busuk});

  @override
  Widget build(BuildContext context) {
    int total = sehat + busuk;
    double persenSehat = total == 0 ? 0 : (sehat / total) * 100;
    double persenBusuk = total == 0 ? 0 : (busuk / total) * 100;

    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              sectionsSpace: 4,
              centerSpaceRadius: 0,
              sections: [
                PieChartSectionData(
                  value: persenSehat,
                  color: AppColors.hijau,
                  radius: 70,
                ),
                PieChartSectionData(
                  value: persenBusuk,
                  color: AppColors.merah,
                  radius: 70,
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _legendBox(AppColors.hijau, "Mangga Sehat"),
            const SizedBox(width: 20),
            _legendBox(AppColors.merah, "Mangga Busuk"),
          ],
        ),
      ],
    );
  }

  Widget _legendBox(Color color, String text) {
    return Row(
      children: [
        Container(width: 18, height: 12, color: color),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
