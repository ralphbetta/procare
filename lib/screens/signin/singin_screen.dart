import 'package:flutter/material.dart';
import 'package:procare_app/screens/signin/components/body.dart';

class SignInScreen extends StatelessWidget {

  static String routeName = '/signin';
  const SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Body();
  }
}
