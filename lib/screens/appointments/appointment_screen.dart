import 'package:flutter/material.dart';
import 'components/body.dart';

class AppointmentScreen extends StatelessWidget {
  static String routeName = '/appointments';
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Body();
  }
}
