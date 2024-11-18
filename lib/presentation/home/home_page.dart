import 'package:flutter/material.dart';
import 'package:grapegrow_submission/core/component/build_context_ext.dart';
import 'package:grapegrow_submission/core/constants/colors.dart';
import 'package:grapegrow_submission/core/constants/theme.dart';
import 'package:grapegrow_submission/data/provider/get_data_provider.dart';
import 'package:grapegrow_submission/presentation/hama/hama_page.dart';
import 'package:grapegrow_submission/presentation/varietas/varietas_page.dart';
import 'package:grapegrow_submission/widget/category_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    final provGetData = context.read<GetDataProvider>();
    provGetData.getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
        title: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat Datang',
                style: fontPlusJakartSans.copyWith(
                  fontSize: sizeSmall,
                  color: AppColors.white
                ),
              ),
              Consumer<GetDataProvider>(
                builder: (context, data, _) {
                  return Text(
                    data.usersData?.name ?? "Null",
                    style: fontPlusJakartSans.copyWith(
                      fontSize: sizeMedium,
                      fontWeight: semiBold,
                      color: AppColors.white
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 4.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fitur Utama',
                style: fontPlusJakartSans.copyWith(
                  fontWeight: bold,
                  fontSize: sizeMedium,
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: CategoryCard(
                      imagePath: "assets/icons/icon_anggur.svg",
                      name: 'Varietas Anggur',
                      onPressed: () => context.push(const VarietasPage()),
                    ),
                  ),
                  Flexible(
                    child: CategoryCard(
                      imagePath: "assets/icons/icon_hama.svg",
                      name: 'Hama & Penyakit',
                      onPressed: () => context.push(const HamaPage()),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}