import 'package:flutter/material.dart';
import 'package:procare_app/screens/chat/components/body.dart';
class ChatScreen extends StatelessWidget {
  static String routeName = '/chat';
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Body();
  }
}



