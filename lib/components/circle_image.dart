import 'package:flutter/material.dart';

import '../theme.dart';

class CircledImages extends StatelessWidget {
  final String image;
  final double radius;
  final bool line;
  const CircledImages({
    Key? key,
    this.radius = 35,
    this.line = true,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(
          border: line?Border.all(width: 2, color: btnColor):null,
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
              image:  AssetImage(image,),
              fit: BoxFit.fill
          )

      ),
    );
  }
}