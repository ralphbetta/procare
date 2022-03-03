import 'package:flutter/material.dart';
import 'package:procare_app/controller/user_notifier.dart';
import 'package:procare_app/routes.dart';
import 'package:procare_app/screens/edit_profile/edit_profile_screen.dart';
import 'package:procare_app/screens/signin/singin_screen.dart';
import 'package:provider/src/provider.dart';

import '../constants.dart';
import '../theme.dart';

void ModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
      //backgroundColor: white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
            child: Container(
          //height: 200,
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 2,
                width: getPercentageWidth(25),
                decoration: BoxDecoration(
                  color: lightText,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(
                height: getPercentageHeight(4),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: getPercentageWidth(5),
                ),
                child: Row(
                  children: [
                    Text('General Setting',
                        style: skipText.copyWith(
                            fontSize: 17,
                            color: transactionText,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: getPercentageWidth(5),
                    ),
                    //Icon(Icons.settings),
                    const Icon(
                      Icons.build,
                      size: 18,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getPercentageHeight(2),
              ),
              Container(
                //color: Colors.red,
                height: getPercentageHeight(18),
                width: getPercentageWidth(90),

                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  childAspectRatio: 3 / 1,
                  shrinkWrap: true,
                  children: [
                    SettingCard(
                        mainCaption: settingDetails[0]['main'],
                        subCaption: settingDetails[0]['sub'],
                        symbol: settingDetails[0]['icon']),
                    SettingCard(
                        mainCaption: settingDetails[1]['main'],
                        subCaption: settingDetails[1]['sub'],
                        symbol: settingDetails[1]['icon']),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, EditProfileScreen.routeName);
                        },
                        child: SettingCard(
                            mainCaption: settingDetails[2]['main'],
                            subCaption: settingDetails[2]['sub'],
                            symbol: settingDetails[2]['icon'])),
                    GestureDetector(
                        onTap: () {
                          //print(emailController.text);
                          irreversibleNavigate(context, const SignInScreen());
                          context.read<UserNotifier>().deleteUser(0);
                        },
                        child: SettingCard(
                            mainCaption: settingDetails[3]['main'],
                            subCaption: settingDetails[3]['sub'],
                            symbol: settingDetails[3]['icon'])),
                  ],
                ),
              ),
              SizedBox(
                height: getPercentageHeight(2),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: getPercentageWidth(5),
                ),
                child: Row(
                  children: [
                    Text('Support',
                        style: skipText.copyWith(
                            fontSize: 17,
                            color: transactionText,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: getPercentageWidth(5),
                    ),
                    //Icon(Icons.settings),
                    const Icon(
                      Icons.settings_outlined,
                      size: 22,
                      color: transactionText,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getPercentageHeight(2),
              ),
              Container(
                //color: Colors.red,
                height: getPercentageHeight(18),
                width: getPercentageWidth(90),

                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  childAspectRatio: 3 / 1,
                  shrinkWrap: true,
                  children: [
                    ...List.generate(
                      4,
                      (index) => SettingCard(
                          mainCaption: supportDetails[index]['main'],
                          subCaption: supportDetails[index]['sub'],
                          symbol: supportDetails[index]['icon']),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
      });
}

class SettingCard extends StatelessWidget {
  final String mainCaption;
  final String subCaption;
  final IconData symbol;
  const SettingCard({
    Key? key,
    required this.mainCaption,
    required this.subCaption,
    required this.symbol,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: getPercentageWidth(45),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            //color: white,
            border: Border.all(width: 1.5, color: darkText)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(mainCaption,
                    style: skipText.copyWith(
                        fontSize: 13,
                        color: nearBlack,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 5,
                ),
                Text(subCaption,
                    style: TextStyle(fontSize: 10, color: lightText)),
              ],
            ),
            SizedBox(
              width: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Icon(
                symbol,
                color: nearBlack,
              ),
            )
          ],
        ));
  }
}

class Logout extends StatefulWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
