import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:procare_app/components/form_modal_sheet.dart';
import 'package:procare_app/components/general_btn.dart';
import 'package:procare_app/constants.dart';
import 'package:procare_app/screens/about/about_screen.dart';
import 'package:procare_app/screens/chat/chat_screen.dart';
import 'package:procare_app/theme.dart';

class Body extends StatefulWidget {
  final String? altText;
  const Body({
    Key? key,
    this.altText,
  }) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //if this page is not properly lapping,
      //remove the safeArea ans change the Container height from
      //82 to 90
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  // this is to determine the overall dimension
                  Container(
                    height: getPercentageHeight(82),
                    color: Colors.green,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: getPercentageHeight(28),
                        width: getPercentageWidth(100),
                        color: lightText,
                        child: Image.asset('assets/images/healthcare.jpg',
                            fit: BoxFit.cover),
                      ),
                      Container(
                        color: btnColor.withOpacity(0.3),
                        height: getPercentageHeight(28),
                        width: getPercentageWidth(100),
                      ),
                      Positioned(
                        left: getPercentageWidth(5),
                        top: getPercentageWidth(5),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child:
                                Icon(Icons.arrow_back, size: 30, color: white)),
                      )
                    ],
                  ),
                  Positioned(
                    top: getPercentageHeight(22),
                    child: Container(
                      height: getPercentageHeight(68),
                      width: getPercentageWidth(100),
                      decoration: const BoxDecoration(
                          color: btnColor,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 7,
                            ),
                            child: Text(
                              widget.altText!,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: white),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: getPercentageHeight(4),
                                  left: getPercentageWidth(5),
                                  right: getPercentageWidth(5)),
                              height: getPercentageHeight(68),
                              width: getPercentageWidth(100),
                              decoration: const BoxDecoration(
                                  color: background,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Procare Eye Clinic',
                                      style: skipText.copyWith(
                                          color: transactionText,
                                          fontSize: largeTextSize - 4)),
                                  SizedBox(
                                    height: getPercentageHeight(1),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.person,
                                        color: darkText,
                                      ),
                                      SizedBox(
                                        width: getPercentageWidth(1),
                                      ),
                                      const Text(
                                        'South Africa',
                                        style: TextStyle(color: darkText),
                                      ),
                                      const HighlightCount(
                                        title: 'Exp. Yrs',
                                        count: '22',
                                      ),
                                      HighlightCount(
                                        title: 'Patience',
                                        count: '132',
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: getPercentageHeight(2),
                                  ),
                                  const Text(
                                    "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi."
                                    "Lorem ipsum dolor uis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(color: darkText),
                                  ),
                                  SizedBox(
                                    height: getPercentageHeight(1),
                                  ),
                                  ...List.generate(
                                      3,
                                      (index) => Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5, bottom: 2),
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 5,
                                                  backgroundColor: darkText,
                                                ),
                                                SizedBox(
                                                  width: getPercentageWidth(3),
                                                ),
                                                Text(
                                                  splashData[index]['title']!,
                                                  style: TextStyle(
                                                      color: darkText),
                                                )
                                              ],
                                            ),
                                          ))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: getPercentageHeight(10),
              decoration: BoxDecoration(
                  color: white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ChatScreen.routeName);
                      },
                      child: const GeneralBtn(
                        title: 'Send Message',
                        split: true,
                        alternate: true,
                        minimal: true,
                      )),
                  GestureDetector(
                      onTap: () {
                        FormModalSheet(context);
                      },
                      child: const GeneralBtn(
                        title: 'Book Now',
                        split: true,
                        alternate: false,
                        minimal: true,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HighlightCount extends StatelessWidget {
  final String count;
  final String title;
  const HighlightCount({
    Key? key,
    required this.count,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: getPercentageWidth(2)),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      decoration: BoxDecoration(
          color: formColor, borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Text(
            '$count+',
            style: TextStyle(fontWeight: FontWeight.bold, color: btnColor),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
