import 'package:flutter/material.dart';
import 'package:mango_sort/frontend/theme/colors.dart';
import 'package:mango_sort/frontend/widgets/textfields.dart';
import 'package:mango_sort/frontend/pages/login.dart';

class GantiPass extends StatefulWidget {
  const GantiPass({super.key});

  @override
  State<GantiPass> createState() => _GantiPassState();
}

class _GantiPassState extends State<GantiPass> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmVisible = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.hijau,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
              decoration: BoxDecoration(
                color: AppColors.putih,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.hitam.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo
                  Image.asset(
                    'assets/images/logo.png',
                    width: size.width * 0.35,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 10),

                  // Judul
                  const Text(
                    "MANGO SORT",
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: AppColors.hitam,
                    ),
                  ),
                  // const SizedBox(height: 1),
                  const Text(
                    "Buat Password Baru",
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.hitam,
                    ),
                  ),
                  const SizedBox(height: 25),

                  //email
                  CustomTextField(
                    label: "Email",
                    controller: emailController,
                  ),
                  const SizedBox(height: 10),

                  // Password baru
                  CustomTextField(
                    label: "Password Baru",
                    controller: passwordController,
                    obscureText: !_isPasswordVisible,
                    hasVisibilityToggle: true,
                    onToggleVisibility: () {
                      setState(() => _isPasswordVisible = !_isPasswordVisible);
                    },
                  ),
                  const SizedBox(height: 10),

                  // konfirmasi Password baru
                  CustomTextField(
                    label: "Konfirmasi Password Baru",
                    controller: passwordController,
                    obscureText: !_isConfirmVisible,
                    hasVisibilityToggle: true,
                    onToggleVisibility: () {
                      setState(() => _isConfirmVisible = !_isConfirmVisible);
                    },
                  ),

                  const SizedBox(height: 25),
                  // Tombol Ganti Password
                  SizedBox(
                    width: 172,
                    height: 38,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.hijau,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadowColor: AppColors.hitam.withOpacity(0.3),
                      ),
                      child: const Text(
                        "Ganti Password",
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: AppColors.putih,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Masuk
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                    child: const Text(
                      "Masuk",
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w400,
                        color: AppColors.biru,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
