import 'package:flutter/material.dart';
import 'package:grapegrow_submission/core/constants/colors.dart';
import 'package:grapegrow_submission/core/constants/theme.dart';
import 'package:grapegrow_submission/data/model/varietas_model.dart';
import 'package:grapegrow_submission/presentation/varietas/detail_varietas_page.dart';
import 'package:grapegrow_submission/widget/item_card.dart';

class VarietasPage extends StatelessWidget {

  const VarietasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Varietas Anggur',
          style: fontPlusJakartSans.copyWith(
            fontSize: sizeMedium,
            fontWeight: medium,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(
          color: AppColors.white
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: varietas.length,
          shrinkWrap: true,
          itemBuilder: (context, int index) {
            return Padding(
              padding: const EdgeInsets.all(4),
              child: ItemCard(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailVarietasPage(data: varietas[index]),
                    ),
                  );
                },
                name: varietas[index].name,
                desc: varietas[index].description,
                imagePath: varietas[index].image,
              ),
            );
          },
        ),
      ),
    );
  }
}