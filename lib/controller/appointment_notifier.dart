import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:procare_app/model/appointment_model.dart';

class AppointmentNotifier extends ChangeNotifier {
  List<AppointmentModel> _appointmentList = [];
  int _id = 0;

  UnmodifiableListView<AppointmentModel> get appointmentList => UnmodifiableListView(_appointmentList);
  int get id => _id;

  addAppointment(AppointmentModel appointment){
    _appointmentList.add(appointment);
    notifyListeners();
  }

  deleteAppointment(index){
    _appointmentList.removeWhere((_appointmentList) => _appointmentList.note == appointmentList[index].note);
    notifyListeners();
  }
  incrementId(){
    _id++;
  }

}