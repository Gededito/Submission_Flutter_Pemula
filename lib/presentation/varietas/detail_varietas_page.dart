import 'package:flutter/material.dart';
import 'package:grapegrow_submission/core/component/build_context_ext.dart';
import 'package:grapegrow_submission/core/constants/colors.dart';
import 'package:grapegrow_submission/core/constants/spaces.dart';
import 'package:grapegrow_submission/core/constants/theme.dart';
import 'package:grapegrow_submission/data/model/varietas_model.dart';

class DetailVarietasPage extends StatelessWidget {
  final VarietasModel data;

  const DetailVarietasPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Varietas Anggur',
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(defaultMargin),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
                child: Image.asset(
                  data.image,
                  width: context.deviceWidth,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const SpaceHeight(12),
              Text(
                data.name,
                style: fontPlusJakartSans.copyWith(
                  fontSize: sizeMedium,
                  fontWeight: semiBold,
                ),
              ),
              const SpaceHeight(8),
              Text(
                'Deskripsi',
                style: fontPlusJakartSans.copyWith(
                  fontSize: sizeSmall,
                  fontWeight: medium,
                ),
              ),
              const SpaceHeight(4),
              Text(
                data.description,
                style: fontPlusJakartSans,
              ),
            ],
          ),
        ),
      ),
    );
  }
}