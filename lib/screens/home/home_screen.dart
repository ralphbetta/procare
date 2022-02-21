import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:procare_app/screens/appointments/appointment_screen.dart';
import 'package:procare_app/screens/home/components/body.dart';
import 'package:procare_app/screens/profile/profile_screen.dart';
import 'package:procare_app/screens/transaction/transaction_screen.dart';
import 'package:procare_app/theme.dart';

import '../../../constants.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  const HomeScreen({
    Key? key,
    required this.sentCurrentPage,
  }) : super(key: key);

  final int sentCurrentPage;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late int currentPage;

  void refreshData() async {
    setState(() {
      currentPage = widget.sentCurrentPage;
    });
  }

  @override
  void initState() {
    super.initState;
    refreshData();
  }

  List pages = [
    const Body(),
    const AppointmentScreen(),
    const TransactionScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      // appBar: AppBar(
      //   elevation: 0,
      //   //backgroundColor: kTransparent,
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //       statusBarColor: background,
      //       statusBarIconBrightness: Brightness.dark
      //   ),
      // ),
      body: pages[currentPage],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomNavigationBar(
          //type: BottomNavigationBarType.fixed,
          selectedItemColor: btnColor,
          unselectedItemColor: lightText,
          currentIndex: currentPage,
          onTap: (int value) {
            setState(() {
              currentPage = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                  size: bottomNavIconSize,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list_alt_rounded,
                  size: bottomNavIconSize,
                ),
                label: 'appointment'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.payment_rounded,
                  size: bottomNavIconSize,
                ),
                label: 'appointment'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: bottomNavIconSize,
                ),
                label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
