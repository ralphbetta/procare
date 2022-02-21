import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:procare_app/components/general_btn.dart';
import 'package:procare_app/db/sqflit_appointment_db.dart';
import 'package:procare_app/model/appointment_model.dart';
import 'package:procare_app/screens/appointments/appointment_screen.dart';
import 'package:procare_app/screens/home/home_screen.dart';

import '../../../constants.dart';
import '../../../theme.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String dob = DateFormat.yMMMMd().format(DateTime.now());

  void setTime(String formatedTime) {
    setState(() {
      startTime = formatedTime;
    });
  }

  Future<void> addAppointment(AppointmentModel appointmentModel) async {
    await SQLHelper.createItem(appointmentModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //     statusBarIconBrightness: Brightness.dark
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
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
                  child: Text('Book Appointment',
                      style: skipText.copyWith(
                          fontSize: 17,
                          color: transactionText,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: getPercentageHeight(1),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Note',
                      style: TextStyle(color: darkText),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 3),
                      width: formInputWidth,
                      padding: const EdgeInsets.only(left: 10),
                      //height: formInputHeight,
                      decoration: BoxDecoration(
                          color: formColor.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(formRadius)),
                      child: TextFormField(
                        controller: noteController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,

                        //obscureText: _isNotVisible?true:false,
                        decoration:
                            formDecoration('Purpose of meeting', true, null),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getPercentageHeight(2),
                ),
                //row for time and intent
                SizedBox(
                  width: formInputWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //print('tapped');
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Time',
                              style: TextStyle(color: darkText),
                            ),
                            GestureDetector(
                              onTap: () {
                                //print('tapped');
                                _getTimeFromUser(context);
                              },
                              child: Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  width: formInputWidth / 2.2,
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  height: formInputHeight,
                                  decoration: BoxDecoration(
                                      color: formColor.withOpacity(0.4),
                                      borderRadius:
                                          BorderRadius.circular(formRadius)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        startTime,
                                        style:
                                            const TextStyle(color: lightText),
                                      ),
                                      const Icon(
                                        Icons.access_time,
                                        color: lightText,
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Intent',
                            style: TextStyle(color: darkText),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 3),
                              width: formInputWidth / 2.2,
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              height: formInputHeight,
                              decoration: BoxDecoration(
                                  color: formColor.withOpacity(0.4),
                                  borderRadius:
                                      BorderRadius.circular(formRadius)),
                              child: DropdownButton(
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down_rounded),
                                  value: selectedValue,
                                  isExpanded: true,
                                  style: const TextStyle(color: lightText),
                                  underline: const SizedBox(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedValue = newValue!;
                                    });
                                  },
                                  items: dropdownItems)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getPercentageHeight(2),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Date',
                      style: TextStyle(color: darkText),
                    ),
                    GestureDetector(
                      onTap: () {
                        _getDateFromUser(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 3),
                        width: formInputWidth,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        height: formInputHeight,
                        decoration: BoxDecoration(
                            color: formColor.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(formRadius)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(dob, style: const TextStyle(color: lightText)),
                            const Icon(
                              Icons.calendar_today,
                              color: lightText,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getPercentageHeight(2),
                ),
                SizedBox(
                    width: formInputWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              if (noteController.text.isNotEmpty) {
                                final _newAppointment = AppointmentModel(
                                  note: noteController.text,
                                  time: startTime,
                                  intent: selectedValue,
                                  date: currentDate.toString(),
                                );
                                addAppointment(_newAppointment);
                                setState(() {
                                  noteController.text = '';
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen(
                                              sentCurrentPage: 1,
                                            )));
                              }
                            },
                            child: GeneralBtn(
                              title: 'Proceed',
                              split: false,
                              alternate: false,
                            ))
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getTimeFromUser(BuildContext context) async {
    var pickedTime = await _showTimePicker(context);
    String _formattedTime = pickedTime.format(context);
    if (pickedTime == null) {
      debugPrint('cancel');
    } else {
      setTime(_formattedTime);
    }
  }

  _showTimePicker(BuildContext context) {
    return showTimePicker(
        context: context,
        initialTime: TimeOfDay(
          hour: int.parse(startTime.split(":")[0]),
          minute: int.parse(startTime.split(":")[1].split(" ")[0]),
        ));
  }

  _getDateFromUser(BuildContext context) async {
    DateTime? _datePicker = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1999),
        lastDate: DateTime(2023));
    if (_datePicker != null) {
      setState(() {
        dob = DateFormat.yMMMMd().format(_datePicker);
        currentDate = _datePicker;
      });
    }
  }

  InputDecoration formDecoration(String text, bool _pass, Icon? display) {
    return InputDecoration(
        hintText: text,
        hintStyle: const TextStyle(color: formText1),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        suffixIcon: display);
  }
}
