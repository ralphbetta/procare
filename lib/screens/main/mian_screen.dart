import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:procare_app/screens/edit_profile/edit_profile_screen.dart';
import 'package:procare_app/screens/home/home_screen.dart';
import 'package:procare_app/screens/signin/singin_screen.dart';
import 'package:procare_app/screens/splash/splash_screen.dart';
import 'package:procare_app/theme.dart';

import '../../size_config.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: SignInScreen(),
    );
  }
}
