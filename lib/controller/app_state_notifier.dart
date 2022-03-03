import 'package:flutter/cupertino.dart';

class AppStateNotifier extends ChangeNotifier {


  bool _isNotStarted = true;
  bool _isLogged = false;


  //this is to enable reading without modifications.
  bool get isNotStarted => _isNotStarted;
  bool get isLogged => _isLogged;

  StartApp() {
    _isNotStarted = false;
    notifyListeners();
  }


}
