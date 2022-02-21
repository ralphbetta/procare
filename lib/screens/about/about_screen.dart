import 'package:flutter/material.dart';

import 'components/body.dart';

class AboutScreen extends StatelessWidget {
  final String? altTile;
  static String routeName = '/about';

  const AboutScreen({Key? key,
    this.altTile = "About Procare"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Body(altText: altTile);
  }
}
