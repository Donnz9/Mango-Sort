import 'package:flutter/material.dart';
import 'package:mango_sort/frontend/theme/colors.dart';
import 'package:mango_sort/frontend/widgets/activity_card.dart';
import 'package:mango_sort/frontend/widgets/diagram_batang.dart';
import 'package:mango_sort/frontend/widgets/diagram_lingkar.dart';

class DataStatistikPage extends StatefulWidget {
  final void Function(int index) onNavigate;
  final int currentIndex;

  const DataStatistikPage({
    super.key,
    required this.onNavigate,
    required this.currentIndex,
  });

  @override
  State<DataStatistikPage> createState() => _DataStatistikPageState();
}

class _DataStatistikPageState extends State<DataStatistikPage> {
  final TextEditingController tanggalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // HEADER
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: AppColors.hijau),
                child: const Center(
                  child: Text(
                    "Data Statistik",
                    style: TextStyle(
                      color: AppColors.putih,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              // Bagian isi dengan padding
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    // DATE PICKER CONTAINER
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.putih,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.hitam.withOpacity(0.08),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Pilih Tanggal",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),

                          GestureDetector(
                            onTap: () {
                              selectDate(
                                context: context,
                                controller: tanggalController,
                                refreshUI: () => setState(() {}),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.hitam),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    tanggalController.text.isEmpty
                                        ? "Pilih tanggal"
                                        : tanggalController.text,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      color:
                                          tanggalController.text.isEmpty
                                              ? AppColors.abuabumuda
                                              : AppColors.hitam,
                                    ),
                                  ),
                                  const Icon(Icons.calendar_month, size: 24),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),

                    // PERBANDINGAN MANGGA SEHAT VS BUSUK
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.putih,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.hitam.withOpacity(0.08),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Perbandingan mangga sehat vs busuk",
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),

                          // PIE CHART DIAGRAM LIGKAR
                          MangoPieChart(
                            sehat: 32, // nanti tinggal ganti dari API
                            busuk: 8,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),

                    // MANGGA SEHAT PER JAM
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.putih,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.hitam.withOpacity(0.08),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Mangga sehat per jam",
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Diagram Batang
                          const MangoBarChart(
                            data: [
                              0,
                              0,
                              0,
                              0,
                              20,
                              30,
                            ], // contoh data (jam 05:00 - 06:00 aktif)
                            labels: [
                              "00",
                              "01",
                              "02",
                              "03",
                              "05",
                              "06",
                            ], // label jam
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
