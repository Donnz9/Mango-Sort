import 'package:flutter/material.dart';
import 'package:mango_sort/pages/dashboard.dart';
import 'package:mango_sort/pages/data_statistik.dart';
import 'package:mango_sort/pages/detail_aktifitas.dart';
import 'package:mango_sort/pages/laporan_riwayat.dart';
import 'package:mango_sort/pages/pengaturan.dart';
import 'package:mango_sort/theme/colors.dart';
import 'package:mango_sort/widgets/nav_item.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 3;

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }


  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      DashboardPage(onNavigate: _onItemTapped),
      DetailAktifitasPage(onNavigate: _onItemTapped),
      DataStatistikPage(onNavigate: _onItemTapped),
      LaporanRiwayatPage(onNavigate: _onItemTapped),
      PengaturanPage(onNavigate: _onItemTapped),
    ];

    return Scaffold(
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () => _onItemTapped(3),
          backgroundColor: AppColors.hijau,
          shape: const CircleBorder(),
          elevation: 10,
          child: const Icon(Icons.home, size: 30, color: AppColors.putih),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ShadowedBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        shadowColor: AppColors.hitam, // Sesuaikan warna bayangan
        shadowElevation: 8.0, // Sesuaikan ketebalan bayangan
      ),
    );
  }
}
