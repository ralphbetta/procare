import 'package:flutter/material.dart';

import '../constants.dart';
import '../theme.dart';
class SkipBtn extends StatelessWidget {
  const SkipBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding+20),
      margin: EdgeInsets.only(top: 15),
      child: Center(child: Text('Skip', style: skipText,)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(skipRadius),
        color: btnColor,
      ),
    );
  }
}
