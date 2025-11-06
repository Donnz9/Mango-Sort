import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mango_sort/frontend/theme/colors.dart';
// import 'package:mango_sort/pages/ganti_pass.dart';
import 'package:mango_sort/frontend/pages/login.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Tunda 3 detik, lalu ganti ke halaman login
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (context, animation, secondaryAnimation) =>
              const Login(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Animasi fade in + slide up
            final tween = Tween(begin: const Offset(0, 0.2), end: Offset.zero)
                .chain(CurveTween(curve: Curves.easeOut));
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(position: animation.drive(tween), child: child),
            );
          },
        ),
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.hijau,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),

              // Bagian Utama (Logo dan Teks)
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: size.width * 0.7, // Lebih fleksibel
                      height: size.height * 0.25,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'MANGGO SORT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      color: AppColors.putih,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    'SMART SORTIR MANGGA',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      color:  AppColors.putih,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),

              // Bagian Versi di Bawah
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.02),
                child: const Text(
                  '',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color:  AppColors.hitam,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}