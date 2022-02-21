
import 'package:flutter/material.dart';

import '../constants.dart';
import '../theme.dart';
class NotContentFlag extends StatelessWidget {
  final String imagePath;
  final String errorMsg;
  const NotContentFlag({Key? key,
    required this.imagePath,
    required this.errorMsg }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: getPercentageHeight(12),),
          Image.asset(imagePath),
          Text(errorMsg, style: skipText.copyWith(color: lightText.withOpacity(0.5)), textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
