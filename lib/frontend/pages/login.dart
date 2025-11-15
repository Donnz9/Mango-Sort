import 'package:flutter/material.dart';
import 'package:mango_sort/backend/firebase_auth_service.dart';
import 'package:mango_sort/frontend/theme/colors.dart';
import 'package:mango_sort/frontend/widgets/main_navigation.dart';
import 'package:mango_sort/frontend/widgets/snackbar.dart';
import 'package:mango_sort/frontend/widgets/textfields.dart';
import 'package:mango_sort/frontend/pages/ganti_pass.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuthService _authService = FirebaseAuthService();

  bool _isPasswordVisible = false;
  bool _isLoading = false;

  Future<void> _handleLogin() async {
    setState(() => _isLoading = true);

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // 1. Cek email kosong
    if (email.isEmpty) {
      Snackbar.show(context, "Email tidak boleh kosong.", isError: true);
      setState(() => _isLoading = false);
      return;
    }

    // 2. Cek format email valid
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegex.hasMatch(email)) {
      Snackbar.show(context, "Format email tidak valid.", isError: true);
      setState(() => _isLoading = false);
      return;
    }

    // 3. Cek password kosong
    if (password.isEmpty) {
      Snackbar.show(context, "Password tidak boleh kosong.", isError: true);
      setState(() => _isLoading = false);
      return;
    }

    // 4. Cek minimal karakter password
    if (password.length < 6) {
      Snackbar.show(context, "Password minimal 6 karakter.", isError: true);
      setState(() => _isLoading = false);
      return;
    }

    // 5. Proses Login Firebase
    print("Mulai login...");
    final message = await _authService.loginUser(email, password);
    print("Hasil login: $message");

    setState(() => _isLoading = false);

    // 6. Login sukses
    if (message == null) {
      if (mounted) {
        Snackbar.show(context, "Login berhasil");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MainNavigation()),
        );
      }
      return;
    }

    // 7. Login gagal
    Snackbar.show(context, "Email & Password salah", isError: true);
  }

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
                    "Masuk Ke Akun Anda",
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.hitam,
                    ),
                  ),
                  const SizedBox(height: 25),

                  //email
                  CustomTextField(label: "Email", controller: emailController),
                  const SizedBox(height: 10),

                  // Password baru
                  CustomTextField(
                    label: "Password",
                    controller: passwordController,
                    obscureText: !_isPasswordVisible,
                    hasVisibilityToggle: true,
                    onToggleVisibility: () {
                      setState(() => _isPasswordVisible = !_isPasswordVisible);
                    },
                  ),

                  const SizedBox(height: 25),
                  // Tombol Ganti Password
                  SizedBox(
                    width: 172,
                    height: 38,
                    child: ElevatedButton(
                      onPressed:
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder:
                          //         (context) =>
                          //             // DashboardPage(onNavigate: (int index) {}, currentIndex: 0,),
                          //             const MainNavigation(),
                          //   ),
                          // );
                          _isLoading ? null : _handleLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.hijau,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadowColor: AppColors.hitam.withOpacity(0.3),
                      ),
                      child:
                          _isLoading
                              ? const CircularProgressIndicator(
                                color: AppColors.putih,
                                strokeWidth: 2,
                              )
                              : const Text(
                                "Masuk",
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: AppColors.putih,
                                ),
                              ),
                    ),
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: AppColors.hijau,
                    //       elevation: 4,
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       shadowColor: AppColors.hitam.withOpacity(0.3),
                    //     ),
                    //     child: const Text(
                    //       "Masuk",
                    //       style: TextStyle(
                    //         fontFamily: 'Rubik',
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 20,
                    //         color: AppColors.putih,
                    //       ),
                    //     ),
                    //   ),
                  ),
                  const SizedBox(height: 10),

                  // Masuk
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GantiPass(),
                        ),
                      );
                    },
                    child: const Text(
                      "Lupa Password",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w100,
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
