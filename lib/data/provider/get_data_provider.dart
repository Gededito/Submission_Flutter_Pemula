import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grapegrow_submission/data/model/users_model.dart';
import 'package:grapegrow_submission/data/provider/register_provider.dart';

class GetDataProvider extends ChangeNotifier {
  String? _uid;
  UsersModel? usersData;

  Future<void> getData() async {
    User? user = RegisterProvider().currentUser;
    _uid = user?.uid;

    final DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('users').doc(_uid).get();
    notifyListeners();

    usersData = UsersModel(
      uid: snapshot.get('uid'),
      name: snapshot.get('name'),
      email: snapshot.get('email'),
      address: snapshot.get('address'),
    );
  }
}