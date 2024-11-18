import 'package:flutter/material.dart';
import 'package:grapegrow_submission/core/component/buttons.dart';
import 'package:grapegrow_submission/core/component/custom_text_field.dart';
import 'package:grapegrow_submission/core/constants/colors.dart';
import 'package:grapegrow_submission/core/constants/spaces.dart';
import 'package:grapegrow_submission/core/constants/theme.dart';
import 'package:grapegrow_submission/data/provider/login_provider.dart';
import 'package:grapegrow_submission/presentation/auth/register_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Grapegrow Apps',
                style: fontPlusJakartSans.copyWith(
                  fontSize: sizeExtra,
                  fontWeight: medium,
                  color: AppColors.primary
                ),
              ),
              const SpaceHeight(20),
              Text(
                'Hallo Selamat Datang di Aplikasi Grapegrow!, Untuk masuk silahkan akun anda',
                style: fontPlusJakartSans.copyWith(
                  fontSize: sizeSmall,
                  fontWeight: medium,
                ),
              ),
              const SpaceHeight(20),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: provider.emailController,
                      label: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email_outlined),
                      validate: provider.validateEmail,
                    ),
                    const SpaceHeight(20),
                    CustomTextField(
                      controller: provider.passController,
                      label: 'Kata Sandi',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: provider.obscureText,
                      prefixIcon: const Icon(Icons.lock_outline_rounded),
                      validate: provider.validatePass,
                    ),
                    const SpaceHeight(50),
                    Consumer<LoginProvider>(builder: (context, login, _) {
                      return Button.filled(
                        onPressed: login.isLoading ? () {
                          null;
                        } : () {
                          if (formKey.currentState!.validate()) {
                            try {
                              login.authenticateLogin(context);
                              login.emailController.clear();
                              login.passController.clear();
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(e.toString()),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Isi semua form'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        label: login.isLoading ? 'Loading' : 'Masuk',
                      );
                    }),
                    const SpaceHeight(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Belum punya akun?',
                          style: fontPlusJakartSans.copyWith(
                            fontSize: sizeExtraSmall,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            provider.emailController.clear();
                            provider.passController.clear();

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Daftar Akun',
                            style: fontPlusJakartSans.copyWith(
                              fontSize: sizeExtraSmall,
                            ),
                          ),
                        ),
                      ],
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