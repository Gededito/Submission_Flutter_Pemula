import 'package:flutter/material.dart';
import 'package:grapegrow_submission/core/constants/colors.dart';
import 'package:grapegrow_submission/core/constants/spaces.dart';
import 'package:grapegrow_submission/core/constants/theme.dart';

class ItemCard extends StatelessWidget {
  final String name;
  final String desc;
  final String imagePath;
  final VoidCallback onPressed;

  const ItemCard({
    super.key,
    required this.name,
    required this.desc,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.2),
              blurRadius: 14,
              offset: const Offset(2, 3),
              spreadRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                child: Image.asset(
                  imagePath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SpaceWidth(12),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: fontPlusJakartSans.copyWith(
                        fontSize: sizeMedium,
                        fontWeight: medium,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                    const SpaceHeight(4),
                    Text(
                      desc,
                      style: fontPlusJakartSans.copyWith(
                        fontSize: sizeExtraSmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 3,
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