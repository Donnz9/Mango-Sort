import 'package:flutter/material.dart';
import 'package:mango_sort/theme/colors.dart';
import 'package:mango_sort/widgets/activity_card.dart';

class LaporanRiwayatPage extends StatefulWidget {
  final void Function(int index) onNavigate;
  final int currentIndex;

  const LaporanRiwayatPage({
    super.key,
    required this.onNavigate,
    required this.currentIndex,
  });

  @override
  State<LaporanRiwayatPage> createState() => _LaporanRiwayatPageState();
}

class _LaporanRiwayatPageState extends State<LaporanRiwayatPage> {
  final TextEditingController tanggalController = TextEditingController();
  int filterIndex = 0; // 0 = semua, 1 = sehat, 2 = busuk

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
                    "Laporan dan Riwayat",
                    style: TextStyle(
                      color: AppColors.putih,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    // LAPORAN SORTIR
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
                            "Laporan Sortir",
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 4),

                          Container(
                            height: 1,
                            color: AppColors.abuabumuda,
                          ), // GARIS
                          const SizedBox(height: 4),

                          const Text(
                            "Saat ini anda berada di filter periode panen harian (21/10/2025)",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: AppColors.abuabu,
                            ),
                          ),
                          const SizedBox(height: 15),

                          // FILTER BUTTONS
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FilterButton(
                                label: "Harian",
                                isSelected: filterIndex == 0,
                                onTap: () => setState(() => filterIndex = 0),
                              ),
                              const SizedBox(width: 10),
                              FilterButton(
                                label: "Musim Panen",
                                isSelected: filterIndex == 1,
                                onTap: () => setState(() => filterIndex = 1),
                              ),
                              const SizedBox(width: 10),
                              FilterButton(
                                label: "Custom",
                                isSelected: filterIndex == 2,
                                onTap: () {
                                  setState(() => filterIndex = 2);
                                  showCustomDateDialog(context);
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LaporanCard(
                                icon: Image.asset(
                                  'assets/images/sehat.png',
                                  height: 40,
                                ),
                                value: "112",
                                label: "Sehat",
                                valueColor: AppColors.hijau,
                              ),
                              LaporanCard(
                                icon: Image.asset(
                                  'assets/images/busuk.png',
                                  height: 40,
                                ),
                                value: "37",
                                label: "Busuk",
                                valueColor: AppColors.merah,
                              ),
                              LaporanCard(
                                icon: Image.asset(
                                  'assets/images/total.png',
                                  height: 40,
                                ),
                                value: "149",
                                label: "Total",
                                valueColor: AppColors.hitam,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.hijau,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                ),
                              ),
                              onPressed: () {
                                // TODO: Tambahkan fungsi unduh laporan PDF
                              },
                              icon: const Icon(
                                Icons.download_rounded,
                                color: AppColors.putih,
                              ),
                              label: const Text(
                                "Unduh Laporan PDF",
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontSize: 14,
                                  color: AppColors.putih,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),

                    // RIWAYAT MUSIM
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
                            "Riwayat Musim",
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            height: 1,
                            color: AppColors.abuabumuda,
                          ), // garis
                          const SizedBox(height: 10),

                          // TABLE
                          Table(
                            border: TableBorder.symmetric(
                              inside: BorderSide(
                                color: AppColors.abuabumuda,
                                width: 0.5,
                              ),
                            ),
                            columnWidths: const {
                              0: FlexColumnWidth(2.5),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(1),
                              3: FlexColumnWidth(1),
                            },
                            children: [
                              // HEADER
                              TableRow(
                                decoration: BoxDecoration(
                                  color: AppColors.abuabumuda.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: Center(
                                      child: Text(
                                        "Musim Panen",
                                        style: TextStyle(
                                          fontFamily: 'Rubik',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: Center(
                                      child: Text(
                                        "Sehat",
                                        style: TextStyle(
                                          fontFamily: 'Rubik',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: Center(
                                      child: Text(
                                        "Busuk",
                                        style: TextStyle(
                                          fontFamily: 'Rubik',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: Center(
                                      child: Text(
                                        "Total",
                                        style: TextStyle(
                                          fontFamily: 'Rubik',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // ROWS DATA
                              buildTableRow(
                                "12/08/2025 - 09/09/2025",
                                "990",
                                "98",
                                "1088",
                              ),
                              buildTableRow(
                                "08/03/2025 - 10/05/2025",
                                "996",
                                "12",
                                "1008",
                              ),
                              buildTableRow(
                                "07/11/2024 - 29/12/2024",
                                "1136",
                                "102",
                                "1238",
                              ),
                              buildTableRow(
                                "02/04/2024 - 11/05/2024",
                                "1024",
                                "30",
                                "1054",
                              ),
                            ],
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
