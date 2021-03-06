import 'package:flutter/material.dart';
import 'package:procare_app/controller/app_state_notifier.dart';
import 'package:procare_app/controller/user_notifier.dart';
import 'package:procare_app/routes.dart';
import 'package:procare_app/screens/main/mian_screen.dart';
import 'package:provider/provider.dart';

import 'controller/appointment_notifier.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AppointmentNotifier()),
      ChangeNotifierProvider(create: (_) => UserNotifier()),
      ChangeNotifierProvider(create: (_) => AppStateNotifier()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
      routes: routes,
    );
  }
}
