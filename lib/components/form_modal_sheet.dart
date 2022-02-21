import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:procare_app/screens/form/form_screen.dart';

void FormModalSheet(BuildContext context){
  showModalBottomSheet(
    //backgroundColor: white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)) ),
      context: context,
      builder: (BuildContext bc){
        return FormScreen();
      });

}
