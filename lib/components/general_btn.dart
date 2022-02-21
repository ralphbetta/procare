import 'package:flutter/material.dart';

import '../constants.dart';
import '../theme.dart';

class GeneralBtn extends StatelessWidget {
  final String title;
  final bool alternate;
  final bool split;
  final bool? minimal;
  const GeneralBtn({
    Key? key,
    required this.title,
    required this.alternate,
    required this.split,
    this.minimal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: split ? formInputWidth / 2.2 : formInputWidth,
      padding: const EdgeInsets.only(left: 3),
      height: split ? formInputHeight * 0.8 : formInputHeight,
      decoration: BoxDecoration(
          color: alternate ? white : btnColor,
          borderRadius: BorderRadius.circular(formRadius),
          border:
              Border.all(width: 1.5, color: alternate ? btnColor : btnColor)),
      child: Center(
        child: Text(
          title,
          style: skipText.copyWith(
              color: alternate ? btnColor : Colors.white,
              fontSize: minimal! ? 15 : 20),
        ),
      ),
    );
  }
}
