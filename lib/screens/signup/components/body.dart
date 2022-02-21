import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:procare_app/components/general_btn.dart';
import 'package:procare_app/components/app_bar.dart';
import 'package:procare_app/db/user_db.dart';
import 'package:procare_app/model/user_model.dart';
import 'package:procare_app/screens/signin/singin_screen.dart';
import 'package:procare_app/theme.dart';

import '../../../constants.dart';
import '../../../routes.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isNotVisible = true;
  bool _isNotVisible2 = true;
  bool _remindMe = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  void _validate() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _passwordConfirmController.text.isNotEmpty) {
      //'validate email and authenticate...'
      List<User> result = userList
          .where((element) => element.email!.contains(_emailController.text))
          .toList();

      if (_passwordController.text == _passwordConfirmController.text) {
        if (result.isEmpty) {
          userList.add(User(
              email: _emailController.text,
              password: _passwordController.text,
              fullName: 'Anonymous'));

          irreversibleNavigate(context, SignInScreen());
        } else {
          _updateErrorMessage("this email already exist");
        }
      } else {
        _updateErrorMessage("password does not match");
      }
    } else if (_emailController.text.isEmpty) {
      _updateErrorMessage("email is empty");
    } else if (_passwordController.text.isEmpty) {
      _updateErrorMessage("password is empty");
    } else {
      _updateErrorMessage("confirm your password");
    }
  }

  late String errorMsg = "";

  void _clear() {
    setState(() {
      errorMsg = "";
    });
  }

  void _updateErrorMessage(String msg) {
    _clear();
    setState(() {
      errorMsg = msg;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: btnColor,
      appBar: appBar('Sign Up'),
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
                'assets/splash/splash5.png',
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
                  controller: _emailController,
                  onChanged: (value) {
                    _clear();
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: _formDecoration('Enter Email Address', false, 4),
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
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    _clear();
                  },
                  obscureText: _isNotVisible ? true : false,
                  decoration: _formDecoration('Enter Password', true, 1),
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
                  controller: _passwordConfirmController,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    _clear();
                  },
                  obscureText: _isNotVisible2 ? true : false,
                  decoration: _formDecoration('Confirm Password', true, 0),
                ),
              ),
              Text(
                errorMsg,
                style: const TextStyle(color: Colors.red),
              ),
              SizedBox(
                height: getPercentageHeight(2),
              ),
              //check box is here
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
                    RichText(
                        text: TextSpan(
                            text: "By signing up you accept the ",
                            style: const TextStyle(
                                color: lightText,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                            children: [
                          TextSpan(
                              text: "The Term of service\n",
                              style: TextStyle(color: socialColor[2])),
                          const TextSpan(
                              text: "and", style: TextStyle(color: lightText)),
                          TextSpan(
                              text: " Privacy policy",
                              style: TextStyle(color: socialColor[2])),
                        ])),
                  ],
                ),
              ),
              SizedBox(
                height: getPercentageHeight(1),
              ),
              GestureDetector(
                  onTap: () {
                    _validate();
                  },
                  child: const GeneralBtn(
                    title: 'Sign Up',
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
                    onTap: () =>
                        Navigator.pushNamed(context, SignInScreen.routeName),
                    child: RichText(
                        text: const TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(color: lightText),
                            children: [
                          TextSpan(
                              text: "SignIn here",
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

  InputDecoration _formDecoration(String text, bool _pass, int count) {
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
                  count == 1
                      ? setState(() => _isNotVisible = !_isNotVisible)
                      : setState(() => _isNotVisible2 = !_isNotVisible2);
                },
                icon: Icon(
                  _isNotVisible ? Icons.visibility_off : Icons.visibility,
                  color: formText1,
                  size: 22,
                ))
            : null);
  }
}

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      height: 1,
      color: lightText.withOpacity(0.2),
    ));
  }
}
