import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';
import '../theme.dart';


AppBar appBar(String title) {
  return AppBar(
    title: Center(child: Text(title, style: skipText,)),
    //actions: [SizedBox(width: getPercentageWidth(10),)],
    elevation: 0,
    backgroundColor: btnColor,
    systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: btnColor,
        statusBarIconBrightness: Brightness.light
    ),
  );
}