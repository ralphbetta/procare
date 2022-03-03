import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:procare_app/controller/user_notifier.dart';
import 'package:provider/src/provider.dart';

import '../constants.dart';
import '../theme.dart';
import 'form_modal_sheet.dart';
import 'modal_bottom_sheet.dart';

AppBar homeAppBar(BuildContext context, bool isHome) {
  return AppBar(
    title: isHome
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<UserNotifier>().deleteUser(0);
                },
                child: Text(
                  'Hello!',
                  style: smallTextStyle,
                ),
              ),
              Text(
                context
                        .watch<UserNotifier>()
                        .finalUserList
                        .last
                        .fullName!
                        .isNotEmpty
                    ? context.watch<UserNotifier>().finalUserList[0].fullName!
                    : context.watch<UserNotifier>().finalUserList[0].email!,
                style: skipText.copyWith(color: nearBlack, fontSize: 20),
              ),
            ],
          )
        : Text(
            'Profile',
            style: skipText.copyWith(color: transactionText),
          ),
    elevation: 0,
    backgroundColor: white,
    systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: white, statusBarIconBrightness: Brightness.dark),
    actions: [
      //notificationIcon(context),
      SizedBox(
        width: getPercentageWidth(2),
      ),
      IconButton(
          onPressed: () {
            ModalBottomSheet(context);
          },
          icon: const Icon(
            Icons.more_vert_rounded,
            color: darkText,
            size: bottomNavIconSize + 3,
          ))
    ],
  );
}

Center notificationIcon(BuildContext context) {
  return Center(
    child: Stack(
      children: [
        GestureDetector(
            onTap: () {
              FormModalSheet(context);
            },
            child: Icon(
              Icons.notifications_none_rounded,
              color: darkText,
              size: bottomNavIconSize + 3,
            )),
        Positioned(
            right: 6,
            top: 6,
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 4,
            ))
      ],
    ),
  );
}
