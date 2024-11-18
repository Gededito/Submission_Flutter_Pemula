import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grapegrow_submission/presentation/auth/login_page.dart';

class RegisterProvider extends ChangeNotifier {
  bool obscureText1 = true;
  bool obscureText2 = true;
  bool? emailVerified;
  User? get currentUser => firebaseAuth.currentUser;
  bool isLoading = false;

  // Firebase Auth & Firestore
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // Controller
  final _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;
  final _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;
  final _addressController = TextEditingController();
  TextEditingController get addressController => _addressController;
  final _passController = TextEditingController();
  TextEditingController get passController => _passController;
  final _repeatPassController = TextEditingController();
  TextEditingController get repeatPassController => _repeatPassController;

  String? validateName(name) {
    if (name.isEmpty) {
      return 'Nama tidak boleh kosong';
    } else if (name.split('').length < 2) {
      return 'Nama harus terdiri dari minimal 2 kata!';
    } else {
      return null;
    }
  }

  String? validateAddress(alamat) {
    if (alamat.isEmpty) {
      return "Alamat tidak boleh kosong!";
    } else {
      return null;
    }
  }

  String? validateEmail(email) {
    if (email.isEmpty) {
      return "Email tidak boleh kosong!";
    } else if (email.contains(RegExp(r'[!#<>?":$_`~;[\]\\|=+)(*&^%-]'))) {
      return 'Email tidak boleh mengandung karakter khusus!';
    } else {
      return null;
    }
  }

  String? validatePass(pass) {
    if (pass.isEmpty) {
      return "Password tidak boleh kosong!";
    } else if (pass.split('').length < 8) {
      return 'Password harus terdiri dari minimal 8 kata!';
    } else {
      return null;
    }
  }

  String? validatePassRepeat(passRepeat) {
    if (passRepeat.isEmpty) {
      return "Ulangi Kata Sandi tidak boleh kosong!";
    } else if (passRepeat.length < 8) {
      return 'Ulangi Kata Sandi harus terdiri dari minimal 8 karakter!';
    } else if (passRepeat != passController.text) {
      return 'Ulangi Kata Sandi tidak sama dengan Kata Sandi!';
    } else {
      return null;
    }
  }

  void toggleObscureText1() {
    notifyListeners();
    obscureText1 = !obscureText1;
  }

  void toggleObscureText2() {
    notifyListeners();
    obscureText2 = !obscureText2;
  }

  // Register Firebase Auth
  Future<void> authenticateRegister(BuildContext context) async {
    isLoading = true;
    UserCredential userCredential;
    notifyListeners();

    try {
      notifyListeners();

      userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );

      // Pengecekan bahwa firebase auth sukses maka daftarkan
      if (userCredential.user != null) {
        notifyListeners();

        firebaseFirestore
          .collection("users")
          .doc(userCredential.user?.uid)
          .set({
          "uid": userCredential.user!.uid,
          "name": nameController.text,
          "address": addressController.text,
          "email": emailController.text,
          "password": passController.text,
        });

        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return LoginPage();
            })
          );

          nameController.clear();
          emailController.clear();
          passController.clear();
          addressController.clear();
          repeatPassController.clear();

          // Snackbar Pesan Berhasil
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registrasi berhasil! Silahkan login'),
              backgroundColor: Colors.green,
            )
          );
          await firebaseAuth.signOut();
        } else {
          notifyListeners();
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Registrasi gagal! Silahkan coba lagi'),
                backgroundColor: Colors.red,
              ),
            );
          }
        }

        isLoading = false;
        notifyListeners();
      }
    } on FirebaseAuthException catch (error) {
      isLoading = false;
      notifyListeners();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.code),
            backgroundColor: Colors.red,
          )
        );
      }
    }
  }

  // Logout from Firebase Account
  Future<void> logout(BuildContext context) async {
    try {
      notifyListeners();
      await firebaseAuth.signOut();
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return LoginPage();
            }
          )
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Berhasil Keluar Akun'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      notifyListeners();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Colors.red,
          )
        );
      }
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    passController.dispose();
    repeatPassController.dispose();
    super.dispose();
  }
}