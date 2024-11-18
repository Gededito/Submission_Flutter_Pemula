import 'package:flutter/material.dart';
import 'package:grapegrow_submission/core/component/build_context_ext.dart';
import 'package:grapegrow_submission/core/component/buttons.dart';
import 'package:grapegrow_submission/core/constants/colors.dart';
import 'package:grapegrow_submission/core/constants/spaces.dart';
import 'package:grapegrow_submission/core/constants/theme.dart';
import 'package:grapegrow_submission/data/provider/get_data_provider.dart';
import 'package:grapegrow_submission/data/provider/register_provider.dart';
import 'package:grapegrow_submission/presentation/profile/edit_profil_page.dart';
import 'package:grapegrow_submission/presentation/profile/theme_page.dart';
import 'package:grapegrow_submission/widget/profile_widget.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {

  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    final providerGetData = context.read<GetDataProvider>();
    providerGetData.getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
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
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                _profileAccount(),
                const SpaceHeight(16),
                Button.filled(
                  onPressed: () => context.push(EditProfilePage()),
                  label: 'Edit Profil',
                ),
                const SpaceHeight(20),
                const Divider(),
                const SpaceHeight(8),
                ProfileWidget(
                  icon: Icons.settings,
                  title: 'Pengaturan',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ThemePage())
                    );
                  },
                ),
                const SpaceHeight(20),
                Consumer<RegisterProvider>(builder: (context, keluar, _) {
                  return Button.filled(
                    onPressed: () => keluar.logout(context),
                    label: 'Keluar',
                    color: Colors.red,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _profileAccount() {
    return Consumer<GetDataProvider>(builder: (context, data, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            data.usersData?.name ?? "Null",
            style: fontPlusJakartSans.copyWith(
              fontSize: sizeMedium,
              fontWeight: bold,
            ),
          ),
          const SpaceHeight(8),
          Row(
            children: [
              const Icon(
                Icons.email,
                color: Colors.blue,
              ),
              const SpaceWidth(8),
              Text(data.usersData?.email ?? "Null"),
            ],
          ),
          const SpaceHeight(8),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.red,
              ),
              const SpaceWidth(8),
              Text(data.usersData?.address ?? "Null"),
            ],
          ),
        ],
      );
    });
  }
}