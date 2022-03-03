import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:procare_app/constants.dart';
import 'package:procare_app/db/user_db.dart';
import 'package:procare_app/model/user_model.dart';

class UserNotifier extends ChangeNotifier {
  // List<User> _userList = userList
  //     .where((element) => element.email!.contains(emailController.text))
  //     .toList();

  List<User> _userList = [];

  int _id = 0;

  int _genderSwitch = 0;

  //this is to enable reading without modifications.
  //the functions which is called with read is where modification is established
  UnmodifiableListView<User> get finalUserList =>
      UnmodifiableListView(_userList);
  int get id => _id;

  int get genderNotif => _genderSwitch;

  addUser(User user) {
    _userList.add(user);
    notifyListeners();
  }

  editUser(int index, User user) {
    userList.insert(index, user);
    _userList.insert(0, user);

    notifyListeners();
  }

  deleteUser(index) {
    _userList.removeWhere(
        (_appointmentList) => _appointmentList.email == _userList[index].email);
    notifyListeners();
  }

  incrementId() {
    _id++;
  }

  //this is applicable when there are multi content in the list
  sortUser() {
    _userList.sort((a, b) => a.fullName!.compareTo(b.fullName!));
    notifyListeners();
  }

  //this is applicable when there are multi content in the list
  reverseUser() {
    List.of(_userList.reversed);
    notifyListeners();
  }
}
