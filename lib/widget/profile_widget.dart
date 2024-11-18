import 'package:flutter/material.dart';
import 'package:grapegrow_submission/core/constants/colors.dart';
import 'package:grapegrow_submission/core/constants/theme.dart';

class ProfileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;
  final bool endIcon;
  final Color? textColor;

  const ProfileWidget({
    required this.icon,
    required this.title,
    required this.onPressed,
    this.endIcon = true,
    this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.primary.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: AppColors.primary,
        ),
      ),
      title: Text(
        title,
        style: fontPlusJakartSans.copyWith(
          fontSize: sizeMedium,
          color: AppColors.grey,
        )
      ),
      trailing: endIcon
        ? Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.grey.withOpacity(0.1),
        ),
        child: const Icon(
          Icons.chevron_right_rounded,
          size: 20,
          color: AppColors.black,
        ),
      ) : null,
    );
  }
}