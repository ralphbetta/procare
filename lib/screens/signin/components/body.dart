import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:procare_app/components/app_bar.dart';
import 'package:procare_app/components/general_btn.dart';
import 'package:procare_app/components/horizontal_line.dart';
import 'package:procare_app/controller/user_notifier.dart';
import 'package:procare_app/db/user_db.dart';
import 'package:procare_app/model/user_model.dart';
import 'package:procare_app/routes.dart';
import 'package:procare_app/screens/home/home_screen.dart';
import 'package:procare_app/screens/signup/signup_screen.dart';
import 'package:procare_app/theme.dart';
import 'package:provider/src/provider.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isNotVisible = true;
  String isUser = "pending";
  String loginError = "";

  // TextEditingController emailController = TextEditingController();

  // TextEditingController passwordController = TextEditingController();
  Widget _ticker() {
    if (isUser == 'valid') {
      return validIcon;
    } else if (isUser == 'invalid') {
      return inValidIcon;
    } else {
      return nullIcon;
    }
  }

  //List <User> result = [];
  bool _remindMe = false;

  void _validate() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      //debugPrint('validate email and authenticate...');
      List<User> result = userList
          .where((element) => element.email!.contains(emailController.text))
          .toList();
      if (result.isNotEmpty) {
        if (result.first.password == passwordController.text) {
          print('logged in');
          print(result.first.fullName);
          context.read<UserNotifier>().addUser(userList
              .where((element) => element.email!.contains(emailController.text))
              .first);
          irreversibleNavigate(
              context,
              HomeScreen(
                sentCurrentPage: 0,
              ));
        } else {
          print('email and password does not match');
          setState(() {
            loginError = 'email and password does not match';
          });
          print(result.first.password);
          print(result.first.password);
        }
      } else {
        print('user does not exist');
        setState(() {
          loginError = 'user does not exist';
        });
      }
    } else if (emailController.text.isEmpty) {
      debugPrint('empty email');
    } else {
      debugPrint('password empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: btnColor,
      appBar: appBar('Sign In'),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              color: white,
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(bodyRadius))),
          width: getPercentageWidth(100),
          height: getPercentageHeight(100),
          child: Column(
            children: [
              SizedBox(
                height: getPercentageHeight(3),
              ),
              Image.asset(
                'assets/splash/splash4.png',
                width: getPercentageWidth(60),
              ),
              SizedBox(
                height: getPercentageHeight(2),
              ),
              Container(
                width: formInputWidth,
                padding: const EdgeInsets.only(left: 3),
                height: formInputHeight,
                decoration: BoxDecoration(
                    color: formColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(formRadius)),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration:
                      _formDecoration('Enter Email Address', false, _ticker()),
                  onChanged: (value) {
                    if (loginError.isNotEmpty) {
                      setState(() {
                        loginError = '';
                      });
                    }
                    if (value.isEmpty) {
                      setState(() {
                        isUser = 'pending';
                      });
                    } else {
                      if (emailValidatorRegExp.hasMatch(value)) {
                        setState(() {
                          isUser = 'valid';
                        });
                      } else {
                        setState(() {
                          isUser = 'invalid';
                        });
                      }
                      ;
                    }
                  },
                  onSaved: (newValue) {
                    print(newValue);
                  },
                ),
              ),
              SizedBox(
                height: getPercentageHeight(2),
              ),
              Container(
                width: formInputWidth,
                padding: const EdgeInsets.only(left: 3),
                height: formInputHeight,
                decoration: BoxDecoration(
                    color: formColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(formRadius)),
                child: TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: _isNotVisible ? true : false,
                  decoration:
                      _formDecoration('Enter Password', true, Container()),
                  onChanged: (value) {
                    if (loginError.isNotEmpty) {
                      setState(() {
                        loginError = '';
                      });
                    }
                  },
                ),
              ),
              Text(
                loginError,
                style: TextStyle(color: failed),
              ),
              SizedBox(
                height: getPercentageHeight(0),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: getPercentageWidth(5), right: getPercentageWidth(9)),
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 0.9,
                      child: Checkbox(
                        value: _remindMe,
                        splashRadius: 2,
                        tristate: false,
                        onChanged: (value) {
                          setState(() {
                            _remindMe = !_remindMe;
                          });
                        },
                      ),
                    ),
                    const Text(
                      'Remind Me',
                      style: TextStyle(color: darkText),
                    ),
                    Expanded(child: Container()),
                    const Text(
                      'Forgot Password',
                      style: TextStyle(color: btnColor),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: getPercentageHeight(1),
              ),
              GestureDetector(
                  onTap: () {
                    _validate();
                    //irreversibleNavigate(context, const HomeScreen());
                  },
                  child: const GeneralBtn(
                    title: 'Sign In',
                    split: false,
                    alternate: false,
                  )),
              SizedBox(
                height: getPercentageHeight(3),
              ),
              //or sign in
              Container(
                  padding: EdgeInsets.only(
                      left: getPercentageWidth(25),
                      right: getPercentageWidth(25)),
                  child: Row(
                    children: const [
                      HorizontalLine(),
                      Text(
                        'Or Signin with',
                        style: TextStyle(color: darkText),
                      ),
                      HorizontalLine(),
                    ],
                  )),
              SizedBox(
                height: getPercentageHeight(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      3,
                      (index) => Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: socialColor[index],
                              child: SvgPicture.asset(
                                socials[index],
                                height: 13,
                                color: white,
                              ),
                            ),
                          ))
                ],
              ),
              SizedBox(
                height: getPercentageHeight(3),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpScreen.routeName);
                    },
                    child: RichText(
                        text: const TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(color: lightText),
                            children: [
                          TextSpan(
                              text: "Register here",
                              style: TextStyle(color: btnColor))
                        ])),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  InputDecoration _formDecoration(
    String text,
    bool _pass,
    Widget ticker,
  ) {
    return InputDecoration(
        hintText: text,
        hintStyle: const TextStyle(color: formText1),
        prefixIcon: Icon(
          !_pass ? Icons.email : Icons.lock,
          color: formText1,
          size: 22,
        ),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        suffixIcon: _pass
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _isNotVisible = !_isNotVisible;
                  });
                },
                icon: Icon(
                  _isNotVisible ? Icons.visibility_off : Icons.visibility,
                  color: formText1,
                  size: 22,
                ))
            : ticker);
  }
}
