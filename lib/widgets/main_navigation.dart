import 'package:flutter/material.dart';
import 'package:mango_sort/pages/dashboard.dart';
import 'package:mango_sort/pages/data_statistik.dart';
import 'package:mango_sort/pages/detail_aktifitas.dart';
import 'package:mango_sort/pages/laporan_riwayat.dart';
import 'package:mango_sort/pages/pengaturan/pengaturan.dart';
import 'package:mango_sort/widgets/nav_item.dart';
import 'package:mango_sort/theme/colors.dart';

class MainNavigation extends StatefulWidget {
  // final UserModel user;
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;
  // late UserModel currentUser;

  @override
  void initState() {
    super.initState();
    // currentUser = widget.user;
  }

  // UPDATE USER MODEL DARI PROFILE
  // void _updateUserModel(UserModel updatedUser) {
  //   setState(() => currentUser = updatedUser);
  // }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      DashboardPage(onNavigate: _onItemTapped, currentIndex: _selectedIndex,),
      DetailAktifitasPage(onNavigate: _onItemTapped, currentIndex: _selectedIndex,),
      DataStatistikPage(onNavigate: _onItemTapped, currentIndex: _selectedIndex,),
      LaporanRiwayatPage(onNavigate: _onItemTapped, currentIndex: _selectedIndex,),
      PengaturanPage(onNavigate: _onItemTapped, currentIndex: _selectedIndex,),
    ];

    return Scaffold(
      backgroundColor: AppColors.putih,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: _pages[_selectedIndex]),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

