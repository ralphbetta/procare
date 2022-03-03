import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:procare_app/db/sqflit_appointment_db.dart';
import 'package:procare_app/model/appointment_model.dart';

class AppointmentNotifier extends ChangeNotifier {
  List<AppointmentModel> _appointmentList = [];
  int _id = 0;

  UnmodifiableListView<AppointmentModel> get appointmentList =>
      UnmodifiableListView(_appointmentList);
  int get id => _id;

  addAppointment(AppointmentModel appointmentModel) async {
    _appointmentList.add(appointmentModel);
    await SQLHelper.createItem(appointmentModel);
    notifyListeners();
  }

  deleteAppointment(index) {
    _appointmentList.removeWhere((_appointmentList) =>
        _appointmentList.note == appointmentList[index].note);
    notifyListeners();
  }

  incrementId() {
    _id++;
  }
}
