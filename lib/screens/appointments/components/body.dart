import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:procare_app/components/empty_display.dart';
import 'package:procare_app/components/form_modal_sheet.dart';
import 'package:procare_app/db/sqflit_appointment_db.dart';
import 'package:procare_app/model/appointment_model.dart';

import '../../../constants.dart';
import '../../../theme.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late DateTime _selectedDate;
  final today = DateFormat.yMMMMEEEEd().format(DateTime.now());
  List<Map<String, dynamic>> _journal = [];

  void refreshData() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journal = data;
    });
  }

  void setDate(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  @override
  void initState() {
    super.initState;
    refreshData();
  }

  void _deleteAppoint(int id) async {
    await SQLHelper.deleteItem(id);
    refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: btnColor,
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: btnColor,
        ),
        backgroundColor: btnColor,
        title: const Center(
          child: Text('Appointments'),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: getPercentageHeight(100),
          width: getPercentageWidth(100),
          padding: EdgeInsets.only(left: getPercentageWidth(5)),
          decoration: const BoxDecoration(
              color: background,
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(bodyRadius))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getPercentageHeight(3)),
              Container(
                child: DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: btnColor.withOpacity(0.2),
                  onDateChange: (date) {
                    setDate(date);
                  },
                  width: 50.0,
                ),
              ),
              SizedBox(height: getPercentageHeight(2)),
              Text(today, style: appointmentHeading),
              SizedBox(height: getPercentageHeight(2)),
              _journal.isNotEmpty
                  ? Container(
                      margin: const EdgeInsets.only(right: 16),
                      //color: Colors.red,
                      height: getPercentageHeight(56),
                      width: getPercentageWidth(100),
                      child: ListView.builder(
                          itemCount: _journal.length,
                          itemBuilder: (_, index) {
                            return Dismissible(
                                key: Key('item ${_journal[index]}'),
                                secondaryBackground: Container(
                                  color: Colors.red,
                                  child: Row(
                                    children: [
                                      Expanded(child: Container()),
                                      const Icon(
                                        Icons.cancel,
                                        color: white,
                                      ),
                                      SizedBox(
                                        width: getPercentageWidth(2),
                                      ),
                                      const Text(
                                        'Move to Trash',
                                        style: TextStyle(color: white),
                                      ),
                                      SizedBox(
                                        width: getPercentageWidth(2),
                                      )
                                    ],
                                  ),
                                ),
                                background: Container(
                                  color: Colors.green,
                                ),
                                onDismissed: (DismissDirection direction) {
                                  if (direction ==
                                      DismissDirection.startToEnd) {
                                    print('Add to favorite');
                                  } else {
                                    print('Remove');
                                  }
                                  setState(() {
                                    _journal.removeAt(index);
                                  });
                                },
                                confirmDismiss:
                                    (DismissDirection direction) async {
                                  //showing confirmation
                                  return await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Confirm'),
                                          content: const Text(
                                              'Are you sure you want to delete this?'),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(false);
                                                },
                                                child: Text('Cancel')),
                                            TextButton(
                                                onPressed: () {
                                                  _deleteAppoint(
                                                      _journal[index]['id']);
                                                  Navigator.of(context)
                                                      .pop(true);
                                                },
                                                child: const Text('Proceed')),
                                          ],
                                        );
                                      });
                                },
                                child: GestureDetector(
                                    onTap: () {
                                      print("TAPPED");
                                    },
                                    child: AppointmentCard(
                                      test: _journal[index],
                                    )));
                          }))
                  : const NotContentFlag(
                      imagePath: "assets/icons/Artboard 20medIcons2.png",
                      errorMsg: "Sorry you do not have any active appointment",
                    ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FormModalSheet(context);
        },
        child: Icon(Icons.add),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(formRadius)),
        backgroundColor: btnColor,
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final Map<String, dynamic> test;
  const AppointmentCard({
    Key? key,
    required this.test,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: getPercentageHeight(1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            width: 60,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(formRadius),
              color: formText1.withOpacity(0.2),
            ),
            child: Center(child: Image.asset(iconImage(test['intent']))),
          ),
          SizedBox(width: getPercentageWidth(2)),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  test['intent'].toString(),
                  style: appointmentHeading.copyWith(color: darkText),
                ),
                SizedBox(
                  height: getPercentageHeight(1),
                ),
                Container(
                    width: getPercentageWidth(50),
                    child: Text(
                      test['note'].toString(),
                      style: appointmentBody,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 8.0),
            child: Column(
              children: [
                Text(
                  'Mon',
                  style: appointmentBody.copyWith(color: btnColor),
                ),
                SizedBox(
                  height: getPercentageHeight(1),
                ),
                Text(
                  test['time'],
                  style: appointmentBody.copyWith(color: btnColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
