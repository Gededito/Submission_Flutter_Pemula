import 'package:flutter/material.dart';
import 'package:grapegrow_submission/core/constants/colors.dart';
import 'package:grapegrow_submission/core/constants/theme.dart';
import 'package:grapegrow_submission/data/model/hama_model.dart';
import 'package:grapegrow_submission/presentation/hama/detail_hama_page.dart';
import 'package:grapegrow_submission/widget/item_card.dart';

class HamaPage extends StatelessWidget {

  const HamaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hama Dan Penyakit',
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
        child: ListView.builder(
          itemCount: hama.length,
          shrinkWrap: true,
          itemBuilder: (context, int index) {
            return Padding(
              padding: const EdgeInsets.all(4),
              child: ItemCard(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailHamaPage(data: hama[index]),
                    ),
                  );
                },
                name: hama[index].name,
                desc: hama[index].description,
                imagePath: hama[index].image,
              ),
            );
          },
        ),
      ),
    );
  }
}