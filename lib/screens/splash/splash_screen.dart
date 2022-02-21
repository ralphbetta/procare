import 'package:flutter/material.dart';
import 'package:procare_app/screens/splash/components/body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName ='/splash';
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Body();
  }
}
