import 'package:flutter/material.dart';
import 'package:procare_app/screens/edit_profile/components/body.dart';

class EditProfileScreen extends StatelessWidget {
  static String routeName = '/edit_profile';
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Body();
  }
}
