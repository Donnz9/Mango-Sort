import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mango_sort/theme/colors.dart';

class MangoBarChart extends StatelessWidget {
  final List<int> data; // data jumlah mangga sehat per jam
  final List<String> labels; // label jam (misal ["20", "21", "22", ...])

  const MangoBarChart({
    super.key,
    required this.data,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          gridData: FlGridData(show: true, horizontalInterval: 5),
          borderData: FlBorderData(show: false),
          alignment: BarChartAlignment.spaceAround,
          titlesData: FlTitlesData(
            show: true,
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 5,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.black54,
                      fontFamily: 'Inter',
                    ),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index < 0 || index >= labels.length) return const SizedBox();
                  return Text(
                    labels[index],
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.black54,
                      fontFamily: 'Inter',
                    ),
                  );
                },
              ),
            ),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          barGroups: data.asMap().entries.map((entry) {
            final index = entry.key;
            final value = entry.value;
            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: value.toDouble(),
                  color: AppColors.hijau,
                  width: 16,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
