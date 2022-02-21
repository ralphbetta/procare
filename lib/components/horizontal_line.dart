import 'package:flutter/material.dart';

import '../theme.dart';

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(height: 1, color: lightText.withOpacity(0.2),));
  }
}
