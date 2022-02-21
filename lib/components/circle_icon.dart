import 'package:flutter/material.dart';

import '../constants.dart';
import '../theme.dart';
class CircledIcon extends StatelessWidget {
  const CircledIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: const EdgeInsets.all(5),
        height: getPercentageHeight(7),
        width: getPercentageHeight(7),
        color: white.withOpacity(0.1),
        child: Image.asset('assets/icons/ribbon.png', color: white,),
      ),
    );
  }
}