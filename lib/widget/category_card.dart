import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grapegrow_submission/core/constants/colors.dart';
import 'package:grapegrow_submission/core/constants/spaces.dart';
import 'package:grapegrow_submission/core/constants/theme.dart';

class CategoryCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final VoidCallback onPressed;

  const CategoryCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(defaultMargin),
        child: Column(
          children: [
            SvgPicture.asset(
              imagePath,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
            const SpaceHeight(8),
            Text(
              name,
              style: fontPlusJakartSans.copyWith(
                fontSize: sizeSmall,
                fontWeight: medium,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}