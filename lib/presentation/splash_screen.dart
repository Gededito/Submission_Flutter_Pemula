import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grapegrow_submission/core/constants/colors.dart';
import 'package:grapegrow_submission/core/constants/spaces.dart';
import 'package:grapegrow_submission/core/constants/theme.dart';
import 'package:grapegrow_submission/main.dart';
import 'package:grapegrow_submission/presentation/auth/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    _checkLoginStatus();
    super.initState();
  }

  Future<void> _checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 10));

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardPage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/splash_screen.jpg',
              width: 150,
              height: 150,
            ),
            const SpaceHeight(20),
            Text(
              "GrapeGrow Apps",
              style: fontPlusJakartSans.copyWith(
                color: AppColors.primary,
                fontSize: sizeExtraLarge,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}