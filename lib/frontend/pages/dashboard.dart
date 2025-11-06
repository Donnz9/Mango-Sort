import 'package:flutter/material.dart';
import 'package:mango_sort/frontend/theme/colors.dart';
import 'package:mango_sort/frontend/widgets/activity_card.dart';
import 'package:mango_sort/frontend/widgets/stat_card.dart';

class DashboardPage extends StatelessWidget {
  final void Function(int index) onNavigate;
  final int currentIndex;

  const DashboardPage({
    super.key,
    required this.onNavigate,
    required this.currentIndex,
  });

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
                    "Monitoring Sortir Mangga",
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

                    // STATISTIC CARDS
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        StatCard(
                          icon: Image.asset(
                            'assets/images/sehat.png',
                            height: 40,
                          ),
                          title: "mangga Segar",
                          value: "112",
                          color: AppColors.putih,
                          textColor: AppColors.hijau,
                        ),

                        StatCard(
                          icon: Image.asset(
                            'assets/images/busuk.png',
                            height: 40,
                          ),
                          title: 'Mangga Busuk',
                          value: '37',
                          color: AppColors.putih,
                          textColor: AppColors.merah,
                        ),

                        StatCard(
                          icon: Image.asset(
                            'assets/images/total.png',
                            height: 40,
                          ),
                          title: 'Total di Proses',
                          value: '149',
                          color: AppColors.putih,
                          textColor: AppColors.hitam,
                        ),

                        StatCard(
                          icon: Image.asset(
                            'assets/images/conveyor.png',
                            height: 40,
                          ),
                          title: 'Status Conveyor',
                          value: 'Berjalan',
                          color: AppColors.putih,
                          textColor: AppColors.hijau,
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // REAL-TIME ACTIVITY WRAPPED IN CONTAINER
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.putih,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.hitam.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Aktivitas Real-Time",
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 10),

                          ActivityCard(
                            icon: Image.asset(
                              'assets/images/sehat.png',
                              height: 37,
                            ),
                            title: 'Mangga Sehat Terdeteksi',
                            time: '21/10/2025 12:23:32',
                            color: AppColors.hijaumuda,
                            borderColor: AppColors.hijau,
                          ),
                          ActivityCard(
                            icon: Image.asset(
                              'assets/images/sehat.png',
                              height: 37,
                            ),
                            title: 'Mangga Sehat Terdeteksi',
                            time: '21/10/2025 12:23:28',
                            color: AppColors.hijaumuda,
                            borderColor: AppColors.hijau,
                          ),
                          ActivityCard(
                            icon: Image.asset(
                              'assets/images/busuk.png',
                              height: 37,
                            ),
                            title: 'Mangga Busuk Terdeteksi',
                            time: '21/10/2025 12:23:19',
                            color: AppColors.merahmuda,
                            borderColor: AppColors.merah,
                          ),
                          ActivityCard(
                            icon: Image.asset(
                              'assets/images/sehat.png',
                              height: 37,
                            ),
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
