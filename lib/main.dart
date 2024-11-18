import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grapegrow_submission/core/constants/colors.dart';
import 'package:grapegrow_submission/data/provider/edit_profile_provider.dart';
import 'package:grapegrow_submission/data/provider/get_data_provider.dart';
import 'package:grapegrow_submission/data/provider/login_provider.dart';
import 'package:grapegrow_submission/data/provider/register_provider.dart';
import 'package:grapegrow_submission/data/provider/theme_provider.dart';
import 'package:grapegrow_submission/firebase_options.dart';
import 'package:grapegrow_submission/presentation/home/home_page.dart';
import 'package:grapegrow_submission/presentation/profile/profile_page.dart';
import 'package:grapegrow_submission/presentation/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RegisterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => GetDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => EditProfileProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, theme, _) {
          return MaterialApp(
            title: 'GrapeGrow Apps',
            theme: theme.themeData,
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          );
        }
      )
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  int _selectedIndex = 0;

  final List<Widget> _page = [
    const HomePage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primary,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil'
          ),
        ],
      ),
    );
  }
}