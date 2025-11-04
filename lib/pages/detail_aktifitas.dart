import 'package:flutter/material.dart';
import 'package:mango_sort/theme/colors.dart';
import 'package:mango_sort/widgets/activity_card.dart';

class DetailAktifitasPage extends StatefulWidget {
  final void Function(int index) onNavigate;
  final int currentIndex;

  const DetailAktifitasPage({
    super.key,
    required this.onNavigate,
    required this.currentIndex,
  });

  @override
  State<DetailAktifitasPage> createState() => _DetailAktifitasPageState();
}

class _DetailAktifitasPageState extends State<DetailAktifitasPage> {
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
                    "Detail Aktifitas",
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

                    const SizedBox(height: 20),

                    // REAL-TIME ACTIVITY LIST
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
                        children: const [
                          ActivityCard(
                            emoji: '🥭',
                            title: 'Mangga Sehat Terdeteksi',
                            time: '21/10/2025 12:23:32',
                            color: AppColors.hijaumuda,
                            borderColor: AppColors.hijau,
                          ),
                          ActivityCard(
                            emoji: '🥭',
                            title: 'Mangga Sehat Terdeteksi',
                            time: '21/10/2025 12:23:28',
                            color: AppColors.hijaumuda,
                            borderColor: AppColors.hijau,
                          ),
                          ActivityCard(
                            emoji: '🥭',
                            title: 'Mangga Busuk Terdeteksi',
                            time: '21/10/2025 12:23:19',
                            color: AppColors.merahmuda,
                            borderColor: AppColors.merah,
                          ),
                          ActivityCard(
                            emoji: '🥭',
                            title: 'Mangga Sehat Terdeteksi',
                            time: '21/10/2025 12:23:14',
                            color: AppColors.hijaumuda,
                            borderColor: AppColors.hijau,
                          ),
                          ActivityCard(
                            emoji: '🥭',
                            title: 'Mangga Busuk Terdeteksi',
                            time: '21/10/2025 12:23:19',
                            color: AppColors.merahmuda,
                            borderColor: AppColors.merah,
                          ),
                          ActivityCard(
                            emoji: '🥭',
                            title: 'Mangga Sehat Terdeteksi',
                            time: '21/10/2025 12:23:14',
                            color: AppColors.hijaumuda,
                            borderColor: AppColors.hijau,
                          ),
                          ActivityCard(
                            emoji: '🥭',
                            title: 'Mangga Busuk Terdeteksi',
                            time: '21/10/2025 12:23:19',
                            color: AppColors.merahmuda,
                            borderColor: AppColors.merah,
                          ),
                          ActivityCard(
                            emoji: '🥭',
                            title: 'Mangga Sehat Terdeteksi',
                            time: '21/10/2025 12:23:14',
                            color: AppColors.hijaumuda,
                            borderColor: AppColors.hijau,
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
