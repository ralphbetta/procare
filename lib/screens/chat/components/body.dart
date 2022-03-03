import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:procare_app/components/circle_image.dart';
import 'package:procare_app/components/empty_display.dart';
import 'package:procare_app/components/modal_bottom_sheet.dart';
import 'package:procare_app/controller/user_notifier.dart';
import 'package:provider/src/provider.dart';

import '../../../constants.dart';
import '../../../theme.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<int> messageSequence = [8];

  List _chats = [];
  void refreshData() async {
    setState(() {
      _chats = Chat;
    });
  }

  TextEditingController _msgController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: white, statusBarIconBrightness: Brightness.dark),
        backgroundColor: white,
        iconTheme: const IconThemeData(color: nearBlack),
        actions: [
          //notificationIcon(context),
          SizedBox(
            width: getPercentageWidth(15),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: CircledImages(
              image: context.watch<UserNotifier>().finalUserList.first.email ==
                      "user2@gmail.com"
                  ? 'assets/images/team4.jpg'
                  : 'assets/images/team2.jpg',
              radius: 40,
            ),
          ),
          SizedBox(
            width: getPercentageWidth(3),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr Gloria Martin',
                  style: smallTextStyle.copyWith(
                      color: nearBlack, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.green,
                    ),
                    SizedBox(
                      width: getPercentageWidth(1),
                    ),
                    Text(
                      'online',
                      style: TextStyle(color: btnColor),
                    ),
                  ],
                ),
                //
              ],
            ),
          ),
          Expanded(child: Container()),
          IconButton(
              onPressed: () {
                ModalBottomSheet(context);
              },
              icon: const Icon(
                Icons.more_vert_rounded,
                color: darkText,
                size: bottomNavIconSize + 3,
              )),
        ],
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Chat.isNotEmpty
                ? Container(
                    color: background,
                    padding:
                        EdgeInsets.symmetric(horizontal: getPercentageWidth(5)),
                    child: ListView.builder(
                        itemCount: _chats.length,
                        itemBuilder: (_, index) {
                          return DisplayedText(
                            isSender:
                                _chats[index]['senderID'] == 1 ? true : false,
                            msg: _chats[index]['message'].toString(),
                            time: _chats[index]['time'].toString(),
                          );
                        }))
                : const Center(
                    child: NotContentFlag(
                      errorMsg: "No Messages yet",
                      imagePath: "assets/icons/action2.png",
                    ),
                  ),
          ),
          //messaging input
          Container(
            height: getPercentageHeight(11),
            width: getPercentageWidth(100),
            color: background,
            padding: EdgeInsets.only(
                top: getPercentageHeight(1),
                bottom: getPercentageHeight(2),
                left: getPercentageWidth(5),
                right: getPercentageWidth(5)),
            child: Container(
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(formRadius)),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.only(left: 10),
                          child: TextFormField(
                            controller: _msgController,
                            keyboardType: TextInputType.multiline,
                            maxLines: 2,
                            decoration: InputDecoration(
                              hintText: "Enter Text....",
                              border: InputBorder.none,
                            ),
                          ),
                          color: white)),
                  GestureDetector(
                    onTap: () {
                      Chat.add(
                        {
                          'senderID': 1,
                          'message': _msgController.text,
                          'time': DateFormat.Hm().format(DateTime.now())
                        },
                      );
                      refreshData();
                      setState(() {
                        _msgController.text = "";
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: getPercentageWidth(3)),
                      child: const Icon(
                        Icons.send,
                        color: lightText,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class DisplayedText extends StatelessWidget {
  final bool isSender;
  final String msg;
  final String time;
  const DisplayedText({
    Key? key,
    required this.isSender,
    required this.msg,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: getPercentageHeight(2)),
          //height: getPercentageHeight(10),
          width: getPercentageWidth(60),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          decoration: BoxDecoration(
              color: isSender ? btnColor : formColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(formRadius + 10),
                topRight: !isSender
                    ? Radius.circular(formRadius + 10)
                    : Radius.circular(0),
                topLeft: isSender
                    ? Radius.circular(formRadius + 10)
                    : Radius.circular(0),
                bottomRight: Radius.circular(formRadius + 10),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                msg,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: isSender
                        ? white
                        : Theme.of(context).textTheme.headline6!.color),
              ),
              Row(
                children: [
                  Expanded(child: Container()),
                  Text(
                    time,
                    style: TextStyle(
                        color: isSender
                            ? white
                            : Theme.of(context).textTheme.headline6!.color),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
