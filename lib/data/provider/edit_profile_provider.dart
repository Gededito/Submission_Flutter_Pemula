import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grapegrow_submission/core/component/build_context_ext.dart';
import 'package:grapegrow_submission/presentation/profile/profile_page.dart';

class EditProfileProvider extends ChangeNotifier {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String? validateName(name) {
    if (name.isEmpty) {
      return 'Nama tidak boleh kosong';
    } else if (name.split('').length < 2) {
      return 'Nama harus terdiri dari minimal 2 kata!';
    } else {
      return null;
    }
  }

  String? validateAddress(address) {
    if (address.isEmpty) {
      return 'Alamat tidak boleh kosong!';
    } else {
      return null;
    }
  }

  Future<void> updateProfile(BuildContext context) async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      await firestore.collection('users').doc(userId).update({
        'name': nameController.text,
        'address': addressController.text,
      });

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile berhasil diperbarui'),
            backgroundColor: Colors.green,
          ),
        );
        context.push(const ProfilePage());
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Gagal memperbarui profile: $e"),
            backgroundColor: Colors.red,
          )
        );
      }
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    super.dispose();
  }
}