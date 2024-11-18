import 'package:flutter/material.dart';
import 'package:grapegrow_submission/core/component/buttons.dart';
import 'package:grapegrow_submission/core/component/custom_text_field.dart';
import 'package:grapegrow_submission/core/constants/colors.dart';
import 'package:grapegrow_submission/core/constants/spaces.dart';
import 'package:grapegrow_submission/core/constants/theme.dart';
import 'package:grapegrow_submission/data/provider/register_provider.dart';
import 'package:grapegrow_submission/presentation/auth/login_page.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegisterProvider>(context, listen: false);
    final formKey = GlobalKey<FormState>();

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
                  fontWeight: bold,
                  color: AppColors.primary,
                ),
              ),
              const SpaceHeight(20),
              Text(
                'Daftarkan Akunmu Sekarang!',
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
                      controller: provider.nameController,
                      label: 'Nama',
                      keyboardType: TextInputType.name,
                      validate: provider.validateName,
                    ),
                    const SpaceHeight(20),
                    CustomTextField(
                      controller: provider.emailController,
                      label: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      validate: provider.validateEmail,
                    ),
                    const SpaceHeight(20),
                    CustomTextField(
                      controller: provider.addressController,
                      label: 'Alamat',
                      keyboardType: TextInputType.text,
                      validate: provider.validateAddress,
                    ),
                    const SpaceHeight(20),
                    Consumer<RegisterProvider>(
                      builder: (context, data, _) {
                        return CustomTextField(
                          controller: provider.passController,
                          label: 'Kata Sandi',
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: provider.obscureText1,
                          validate: provider.validatePass,
                          suffixIcon: IconButton(
                            icon: Iconify(
                              provider.obscureText1
                                  ? Eva.eye_off_outline
                                  : Eva.eye_outline,
                              color: provider.obscureText1
                                  ? Colors.grey
                                  : AppColors.primary,
                            ),
                            onPressed: () => data.toggleObscureText1(),
                          ),
                        );
                      },
                    ),
                    const SpaceHeight(20),
                    Consumer<RegisterProvider>(
                      builder: (context, data, _) {
                        return CustomTextField(
                          controller: provider.repeatPassController,
                          label: 'Ulangi Kata Sandi',
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: provider.obscureText2,
                          validate: provider.validatePassRepeat,
                          suffixIcon: IconButton(
                            icon: Iconify(
                              provider.obscureText2
                                  ? Eva.eye_off_outline
                                  : Eva.eye_outline,
                              color: provider.obscureText2
                                  ? Colors.grey
                                  : AppColors.primary,
                            ),
                            onPressed: () => data.toggleObscureText2(),
                          ),
                        );
                      },
                    ),
                    const SpaceHeight(50),
                    Consumer<RegisterProvider>(builder: (context, regis, _) {
                      return Button.filled(
                        onPressed: regis.isLoading ? () {
                          null;
                        } : () {
                          if (formKey.currentState!.validate()) {
                            try {
                              regis.authenticateRegister(context);
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
                              )
                            );
                          }
                        },
                        label: regis.isLoading ? 'Loading' : 'Daftar',
                      );
                    },),
                    const SpaceHeight(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sudah punya akun?',
                          style: fontPlusJakartSans.copyWith(
                            fontSize: sizeExtraSmall,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            provider.nameController.clear();
                            provider.emailController.clear();
                            provider.addressController.clear();
                            provider.passController.clear();
                            provider.repeatPassController.clear();

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Sudah',
                            style: fontPlusJakartSans.copyWith(
                              fontSize: sizeExtraSmall
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