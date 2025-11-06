import 'package:flutter/material.dart';
import 'package:mango_sort/frontend/pages/login.dart';
import 'package:mango_sort/frontend/theme/colors.dart';

class PengaturanPage extends StatefulWidget {
  final void Function(int index) onNavigate;
  final int currentIndex;

  const PengaturanPage({
    super.key,
    required this.onNavigate,
    required this.currentIndex,
  });

  @override
  State<PengaturanPage> createState() => _PengaturanPageState();
}

class _PengaturanPageState extends State<PengaturanPage> {
  bool showResetMusim = false;
  bool showTentangAplikasi = false;

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
                    "Pengaturan",
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

                    // LOGO
                    Container(
                      width: double.infinity,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/logo.png', height: 100),
                          const SizedBox(height: 5),
                          const Text(
                            "MANGO SORT",
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: AppColors.abuabu,
                            ),
                          ),
                          const Text(
                            "SMART SORTIR MANGGA",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                              fontSize: 8,
                              color: AppColors.abuabu,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
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
                        children: [
                          _buildMenuItem(
                            icon: Icons.refresh,
                            title: 'Reset Musim',
                            trailing: Icon(
                              showResetMusim
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_right,
                            ),
                            onTap: () {
                              setState(() {
                                showResetMusim = !showResetMusim;
                              });
                            },
                          ),
                          if (showResetMusim) _buildResetMusimContent(),
                          const Divider(height: 1),
                          _buildMenuItem(
                            icon: Icons.info_outline,
                            title: 'Tentang Aplikasi',
                            trailing: Icon(
                              showTentangAplikasi
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_right,
                            ),
                            onTap: () {
                              setState(() {
                                showTentangAplikasi = !showTentangAplikasi;
                              });
                            },
                          ),
                          if (showTentangAplikasi)
                            _buildTentangAplikasiContent(),
                          const Divider(height: 1),
                          _buildMenuItem(
                            icon: Icons.lock_reset,
                            title: 'Ganti Password',
                            onTap: () {},
                          ),
                          const Divider(height: 1),
                          _buildMenuItem(
                            icon: Icons.logout,
                            title: 'Keluar',
                            onTap: () {
                              // Navigasi ke halaman login
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Login(),
                                ),
                              );
                            },
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

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Widget? trailing,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: AppColors.hitam, size: 22),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            trailing ?? const Icon(Icons.chevron_right, color: AppColors.hitam),
          ],
        ),
      ),
    );
  }

  Widget _buildResetMusimContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Fitur ini digunakan untuk mengakhiri musim panen saat ini dan memulai musim panen baru.\n\n'
            '⚠️ Peringatan:\n'
            'Saat Anda menekan tombol Akhiri Musim, seluruh data hasil sortir, statistik, dan aktivitas real-time pada musim berjalan akan disimpan secara otomatis ke dalam Riwayat Musim dalam bentuk ringkasan tabel yang ada di menu Laporan dan Riwayat. Setelah itu, sistem akan siap digunakan untuk periode panen berikutnya.',
            style: TextStyle(fontFamily: 'Inter', fontSize: 15, height: 1.6),
          ),
          const SizedBox(height: 12),
          Center(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.info_outline,
                                  color: AppColors.hitam,
                                  size: 26,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Pesan Peringatan!',
                                  style: TextStyle(
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: AppColors.hitam,
                                  ),
                                ),
                              ],
                            ),

                            // GARIS PEMBATAS
                            const Divider(thickness: 1, color: Colors.black26),
                            const SizedBox(height: 10),

                            const Text(
                              'Apakah anda yakin ingin mengakhiri/mereset musim panen ini?',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 15,
                                height: 1.4,
                                color: AppColors.hitam,
                              ),
                            ),
                            const SizedBox(height: 24),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.hijau,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 28,
                                      vertical: 10,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    elevation: 2,
                                  ),
                                  child: const Text(
                                    'Batal',
                                    style: TextStyle(
                                      color: AppColors.putih,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),

                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    // TODO: Tambahkan logika reset musim di sini
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.merah,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 28,
                                      vertical: 10,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    elevation: 2,
                                  ),
                                  child: const Text(
                                    'Akhiri',
                                    style: TextStyle(
                                      color: AppColors.putih,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.merah,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 3,
              ),
              child: const Text(
                'Akhiri Musim',
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.putih,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTentangAplikasiContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Mango Sort adalah aplikasi berbasis Internet of Things (IoT) yang dirancang untuk membantu proses penyortiran mangga secara otomatis berdasarkan kondisi buah, apakah sehat atau busuk.\n\n'
            'Aplikasi ini menampilkan data sortir secara real-time, menyajikan statistik hasil sesuai periode panen.\n',
            style: TextStyle(fontFamily: 'Inter', fontSize: 15, height: 1.6),
          ),
          Text(
            '💡 Dikembangkan oleh:\nKelompok B2',
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 14.5,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Versi Aplikasi: v1.0.0\nTahun Rilis: 2025',
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 14,
              color: AppColors.hitam,
            ),
          ),
        ],
      ),
    );
  }
}
