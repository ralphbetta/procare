import 'package:flutter/material.dart';

import 'components/body.dart';

class TransactionScreen extends StatelessWidget {
  static String routeName = '/transaction';
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Body();
  }
}
