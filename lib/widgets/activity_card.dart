import 'package:flutter/material.dart';
import 'package:mango_sort/theme/colors.dart';

import 'package:flutter/material.dart';
import 'package:mango_sort/theme/colors.dart';

class ActivityCard extends StatelessWidget {
  final Widget icon; // Ubah dari String emoji → Widget icon
  final String title;
  final String time;
  final Color color;
  final Color borderColor;

  const ActivityCard({
    super.key,
    required this.icon,
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
          icon, // tampilkan widget icon apapun di sini
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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.hijau : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.hijau, width: 2),
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

class LaporanCard extends StatelessWidget {
  final Widget icon;
  final String value;
  final String label;
  final Color valueColor;

  const LaporanCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: AppColors.putih,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.hitam.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: valueColor,
              ),
            ),
            const SizedBox(height: 4),
            icon,
            const SizedBox(height: 6),
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                color: AppColors.hitam,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

TableRow buildTableRow(String musim, String sehat, String busuk, String total) {
  return TableRow(
    children: [
      _buildCell(musim, isLeft: true),
      _buildCell(sehat),
      _buildCell(busuk),
      _buildCell(total),
    ],
  );
}

Widget _buildCell(String text, {bool isLeft = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Align(
      alignment: isLeft ? Alignment.centerLeft : Alignment.center,
      child: Text(
        text,
        style: const TextStyle(fontFamily: 'Inter', fontSize: 11),
      ),
    ),
  );
}

void showCustomDateDialog(BuildContext context) {
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: StatefulBuilder(
            builder: (context, setStateDialog) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pilih Tanggal Awal",
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    controller: startDateController,
                    readOnly: true,
                    onTap:
                        () => selectDate(
                          context: context,
                          controller: startDateController,
                          refreshUI: () => setStateDialog(() {}),
                        ),
                    decoration: _customInputDecoration(),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    "Pilih Tanggal Akhir",
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    controller: endDateController,
                    readOnly: true,
                    onTap:
                        () => selectDate(
                          context: context,
                          controller: endDateController,
                          refreshUI: () => setStateDialog(() {}),
                        ),
                    decoration: _customInputDecoration(),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.merah,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            "Batal",
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              color: AppColors.putih,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.hijau,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                          onPressed: () {
                            if (startDateController.text.isNotEmpty &&
                                endDateController.text.isNotEmpty) {
                              // TODO: Gunakan startDateController.text & endDateController.text
                              Navigator.pop(context);
                            }
                          },
                          child: const Text(
                            "Terapkan",
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              color: AppColors.putih,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      );
    },
  );
}

InputDecoration _customInputDecoration() {
  return InputDecoration(
    hintText: "dd/mm/yyyy",
    suffixIcon: const Icon(Icons.calendar_month),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.abuabumuda),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.hijau, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
  );
}
