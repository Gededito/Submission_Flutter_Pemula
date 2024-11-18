import 'package:flutter/material.dart';
import 'package:grapegrow_submission/core/component/buttons.dart';
import 'package:grapegrow_submission/core/component/custom_text_field.dart';
import 'package:grapegrow_submission/core/constants/colors.dart';
import 'package:grapegrow_submission/core/constants/spaces.dart';
import 'package:grapegrow_submission/core/constants/theme.dart';
import 'package:grapegrow_submission/data/provider/edit_profile_provider.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EditProfileProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
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
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: provider.nameController,
                  label: 'Name',
                  validate: provider.validateName,
                ),
                const SpaceHeight(20),
                CustomTextField(
                  controller: provider.addressController,
                  label: 'Address',
                  validate: provider.validateAddress,
                ),
                const SpaceHeight(50),
                Consumer<EditProfileProvider>(
                  builder: (context, update, _) {
                    return Button.filled(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          try {
                            update.updateProfile(context);
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(e.toString()),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Isi semua form'),
                                backgroundColor: Colors.red,
                              ),
                          );
                        }
                      },
                      label: 'Edit Profile',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}