import 'package:dinesmart_app/app/routes/app_routes.dart';
import 'package:dinesmart_app/app/theme/app_colors.dart';
import 'package:dinesmart_app/core/utils/snackbar_utils.dart';
import 'package:dinesmart_app/features/auth/presentation/state/auth_state.dart';
import 'package:dinesmart_app/features/auth/presentation/view_model/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void initState(){
    super.initState();

  }

  void _navigateToLogin(){
    AppRoutes.pop(context);
  }

  Future<void> _handleSignup() async {
    if (_formKey.currentState!.validate()) {
      await ref
          .read(authViewModelProvider.notifier)
          .register(
            fullName: _nameController.text.trim(),
            email: _emailController.text.trim(),
            username: _emailController.text.trim().split('@').first,
            password: _passwordController.text,
          );
    }
  }




  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);

    // Listen to auth state changes
    ref.listen<AuthState>(authViewModelProvider, (previous, next) {
      if (next.status == AuthStatus.registered) {
        SnackbarUtils.showSuccess(
          context,
          'Registration successful! Please login.',
        );
        Navigator.of(context).pop();
      } else if (next.status == AuthStatus.error && next.errorMessage != null) {
        SnackbarUtils.showError(context, next.errorMessage!);
      }
    });

    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔹 TOP CARD (same as login)
            Container(
              margin: const EdgeInsets.all(2),
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 2, color: Colors.white),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/login_for.png',
                      height: 350,
                      width: 350,
                      fit: BoxFit.fill,
                    ),
                    const Text(
                      'signup',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Divider(
                          height: 3,
                          color: AppColors.primary,
                          indent: 120,
                          endIndent: 120,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height:25),

            // 🔹 FORM
            Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                child: Column(
                  children: [
                    // Full name
                    TextFormField(
                      controller: _nameController,
                      decoration: _inputDecoration(
                        label: 'Full name',
                        hint: 'please enter your name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter your name';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 10),

                    // Email
                    TextFormField(
                      controller: _emailController,
                      decoration: _inputDecoration(
                        label: 'Email address',
                        hint: 'please enter your email',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter valid email';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 10),

                    // Password
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: _inputDecoration(
                        label: 'Password',
                        hint: 'please enter your password',
                      ),
                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return 'password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 10),

                    // Confirm password
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: _inputDecoration(
                        label: 'Confirm password',
                        hint: 're-enter your password',
                      ),
                      validator: (value) {
                        if (value != _passwordController.text) {
                          return 'password does not match';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    // Signup button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          _handleSignup();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white70,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                          'Signup',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 🔹 FOOTER
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _navigateToLogin();
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Reusable underline decoration (same as login)
  InputDecoration _inputDecoration({
    required String label,
    required String hint,
  }) {
    return InputDecoration(
      fillColor: AppColors.backgroundPrimary,
      labelText: label,
      hintText: hint,
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black26, width: 2),
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black26, width: 2),
      ),
    );
  }
}
