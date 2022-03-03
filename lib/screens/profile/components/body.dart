import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:procare_app/components/circle_icon.dart';
import 'package:procare_app/components/circle_image.dart';
import 'package:procare_app/components/home_app_bar.dart';
import 'package:procare_app/controller/user_notifier.dart';
import 'package:provider/src/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:procare_app/theme.dart';
import '../../../constants.dart';
import '../components/body.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context, false),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: white,
              child: Column(
                children: [
                  SizedBox(
                    height: getPercentageHeight(2),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: getPercentageWidth(5)),
                    child: Row(
                      children: [
                        CircledImages(
                          image: context
                                      .watch<UserNotifier>()
                                      .finalUserList
                                      .first.Dp!,
                          //'assets/images/team4.jpg',
                          radius: 50,
                          line: false,
                        ),
                        SizedBox(
                          width: getPercentageWidth(4),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context
                                  .watch<UserNotifier>()
                                  .finalUserList
                                  .first
                                  .fullName!,
                              style: smallTextStyle.copyWith(
                                  color: nearBlack,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "@" +
                                  context
                                      .watch<UserNotifier>()
                                      .finalUserList
                                      .first
                                      .fullName
                                      .toString()
                                      .split(" ")[0],
                              style: TextStyle(color: btnColor),
                            ),
                            //
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: formColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getPercentageHeight(2),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: getPercentageWidth(5)),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(formRadius),
                          border: Border.all(
                              width: 1, color: lightText.withOpacity(0.5))),
                      child: Row(
                        children: [
                          profileCountDetail('234', 'Patient'),
                          Container(
                            height: 50,
                            width: 3,
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        width: 1, color: lightText))),
                          ),
                          profileCountDetail('24hd65', 'Card No.'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getPercentageHeight(2),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getPercentageHeight(1),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, left: getPercentageWidth(4)),
              width: getPercentageWidth(90),
              height: getPercentageHeight(11),
              decoration: BoxDecoration(
                color: btnColor,
                borderRadius: BorderRadius.circular(formRadius),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircledIcon(),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "New Archivement",
                        style: skipText.copyWith(fontSize: 15),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 5, top: 5),
                        height: getPercentageHeight(5),
                        width: getPercentageWidth(60),
                        child: Text(
                          "You got better eye care test results than before",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 13, color: white.withOpacity(0.8)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
                width: getPercentageWidth(100),
                height: getPercentageHeight(43),
                // color: Colors.greenAccent,
                child: ListView(
                  children: [
                    profileCard(context, 0,
                        context.watch<UserNotifier>().finalUserList.first.dob.toString()),
                    profileCard(
                        context,
                        1,
                        context
                            .watch<UserNotifier>()
                            .finalUserList
                            .first
                            .phone
                            .toString()),
                    profileCard(
                        context,
                        2,
                        context
                            .watch<UserNotifier>()
                            .finalUserList
                            .first
                            .email.toString()),
                    profileCard(
                        context,
                        3,
                        context
                            .watch<UserNotifier>()
                            .finalUserList
                            .first
                            .homeAddress.toString()),
                    profileCard(
                        context,
                        4,
                        context
                            .watch<UserNotifier>()
                            .finalUserList
                            .first
                            .nextOfKin.toString()),
                    profileCard(
                        context,
                        5,
                        context
                            .watch<UserNotifier>()
                            .finalUserList
                            .first
                            .NOKPhone
                            .toString()),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

  Card profileCard(BuildContext context, int index, String s) {
    return Card(
      margin:
          EdgeInsets.symmetric(horizontal: getPercentageWidth(5), vertical: 1),
      child: ListTile(
        leading: const CircleAvatar(
          radius: 10,
          backgroundColor: btnColor,
        ),
        title: Text(profileLabel[index]),
        subtitle: Text(s),
      ),
    );
  }

  TimelineTile _timeLineTile(int index) {
    return TimelineTile(
      axis: TimelineAxis.vertical,
      alignment: TimelineAlign.manual,
      lineXY: 0.1,
      afterLineStyle: const LineStyle(thickness: 0),
      beforeLineStyle: const LineStyle(thickness: 0),
      isFirst: index == 0 ? true : false,
      endChild: Container(
        //color: Colors.red,
        margin: EdgeInsets.only(left: 10),
        padding: EdgeInsets.only(top: 10),
        constraints: BoxConstraints(maxHeight: 53),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date of Birth',
              style: TextStyle(
                  color: lightText, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text('12 July 1993',
                style: smallTextStyle.copyWith(
                  color: nearBlack,
                )),
          ],
        ),
      ),
    );
  }

  Expanded profileCountDetail(String id, String caption) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Text(
            id,
            style: skipText.copyWith(color: nearBlack),
          ),
          SizedBox(height: getPercentageHeight(1)),
          Text(
            caption,
            style: smallTextStyle.copyWith(
                fontWeight: FontWeight.bold, color: transactionText2),
          )
        ],
      ),
    ));
  }
}
