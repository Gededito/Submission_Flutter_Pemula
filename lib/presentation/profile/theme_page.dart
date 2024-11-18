import 'package:flutter/material.dart';
import 'package:grapegrow_submission/core/constants/colors.dart';
import 'package:grapegrow_submission/core/constants/theme.dart';
import 'package:grapegrow_submission/data/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tema Aplikasi',
          style: fontPlusJakartSans.copyWith(
            fontSize: sizeMedium,
            fontWeight: medium,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(
          color: AppColors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Consumer<ThemeProvider>(builder: (context, theme, child) {
              return ListTile(
                leading: const Icon(Icons.dark_mode),
                title: Text(
                  'Dark Theme',
                  style: fontPlusJakartSans.copyWith(
                    fontSize: sizeMedium,
                    fontWeight: medium,
                  ),
                ),
                trailing: Switch(
                  value: theme.themeData.brightness == Brightness.dark,
                  onChanged: (value) {
                    theme.toggleTheme();
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}