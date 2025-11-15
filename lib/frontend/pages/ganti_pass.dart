import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mango_sort/frontend/theme/colors.dart';
import 'package:mango_sort/frontend/widgets/textfields.dart';
import 'package:mango_sort/frontend/pages/login.dart';
import 'package:mango_sort/frontend/widgets/snackbar.dart';

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
  bool _isLoading = false;

  void _showSnackbar(String msg, {bool isError = false}) {
    Snackbar.show(context, msg, isError: isError);
  }

  // --------------------------------------------------
  // 🔥 HANDLE GANTI PASSWORD (Firebase)
  // --------------------------------------------------
  Future<void> _handleChangePassword() async {
    final email = emailController.text.trim();
    final pass = passwordController.text.trim();
    final confirm = confirmPasswordController.text.trim();

    // 🔎 Validasi form
    if (email.isEmpty) {
      _showSnackbar("Email tidak boleh kosong", isError: true);
      return;
    }
    if (pass.isEmpty || confirm.isEmpty) {
      _showSnackbar("Password tidak boleh kosong", isError: true);
      return;
    }
    if (pass.length < 6) {
      _showSnackbar("Password minimal 6 karakter", isError: true);
      return;
    }
    if (pass != confirm) {
      _showSnackbar("Password dan konfirmasi tidak cocok", isError: true);
      return;
    }

    setState(() => _isLoading = true);

    try {
      // ✉️ Firebase kirim email reset password
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      _showSnackbar(
        "Link reset password sudah dikirim ke email kamu.",
        isError: false,
      );

      // Arahkan ke halaman login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Login()),
      );
    } catch (e) {
      _showSnackbar("Gagal mengirim email reset: $e", isError: true);
    }

    setState(() => _isLoading = false);
  }

  // --------------------------------------------------

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

                  const Text(
                    "MANGO SORT",
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: AppColors.hitam,
                    ),
                  ),

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

                  // EMAIL
                  CustomTextField(
                    label: "Email",
                    controller: emailController,
                  ),
                  const SizedBox(height: 10),

                  // PASSWORD BARU
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

                  // KONFIRMASI PASSWORD
                  CustomTextField(
                    label: "Konfirmasi Password Baru",
                    controller: confirmPasswordController, // FIX
                    obscureText: !_isConfirmVisible,
                    hasVisibilityToggle: true,
                    onToggleVisibility: () {
                      setState(() => _isConfirmVisible = !_isConfirmVisible);
                    },
                  ),
                  const SizedBox(height: 25),

                  // BUTTON GANTI PASSWORD
                  SizedBox(
                    width: 172,
                    height: 38,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _handleChangePassword,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.hijau,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadowColor: AppColors.hitam.withOpacity(0.3),
                      ),
                      child: _isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text(
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

                  // Balik ke login
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
