import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:procare_app/screens/about/about_screen.dart';
import 'package:procare_app/screens/appointments/appointment_screen.dart';
import 'package:procare_app/screens/chat/chat_screen.dart';
import 'package:procare_app/screens/edit_profile/edit_profile_screen.dart';
import 'package:procare_app/screens/home/home_screen.dart';
import 'package:procare_app/screens/signin/singin_screen.dart';
import 'package:procare_app/screens/signup/signup_screen.dart';
import 'package:procare_app/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  AppointmentScreen.routeName: (context) => AppointmentScreen(),
  ChatScreen.routeName: (context) => ChatScreen(),
  AboutScreen.routeName: (context) => AboutScreen(),
  EditProfileScreen.routeName: (context) => EditProfileScreen(),
  HomeScreen.routeName: (context) => HomeScreen(
        sentCurrentPage: 0,
      ),
};

Future<dynamic> irreversibleNavigate(BuildContext context, screen) {
  return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => screen),
      (Route<dynamic> route) => false);
}
