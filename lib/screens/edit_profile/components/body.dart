import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:procare_app/components/app_bar.dart';
import 'package:procare_app/components/general_btn.dart';
import 'package:procare_app/controller/user_notifier.dart';
import 'package:procare_app/db/user_db.dart';
import 'package:procare_app/model/user_model.dart';
import 'package:procare_app/screens/home/home_screen.dart';
import 'package:procare_app/screens/signup/signup_screen.dart';
import 'package:provider/provider.dart';
import '';
import 'package:provider/src/provider.dart';

import '../../../constants.dart';
import '../../../theme.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //0 for male and 1 for female
  final String dob = DateFormat.yMd().format(DateTime.now());

  List<User> current_user = userList
      .where((element) => element.email!.contains(emailController.text))
      .toList();

  String gender = "male";

  _editUser(BuildContext context) {
    var activeUser =
        userList.where((user) => user.email!.contains(emailController.text));
    debugPrint(activeUser.first.homeAddress);
    fullNameController.text = activeUser.first.fullName!;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('state reset');
    //here we initialize what comes into the form

    dobController.text =
        context.watch<UserNotifier>().finalUserList.first.dob.toString();
    addressController.text = context
        .watch<UserNotifier>()
        .finalUserList
        .first
        .homeAddress
        .toString();
    nokNameController.text =
        context.watch<UserNotifier>().finalUserList.first.nextOfKin.toString();
    nokPhoneController.text =
        context.watch<UserNotifier>().finalUserList.first.NOKPhone.toString();

    fullNameController.text =
        context.watch<UserNotifier>().finalUserList.first.fullName!;
    phoneController.text =
        context.watch<UserNotifier>().finalUserList.first.phone.toString();
    dobController.text =
        context.watch<UserNotifier>().finalUserList.first.dob ?? "empty";
    addressController.text = context
        .watch<UserNotifier>()
        .finalUserList
        .first
        .homeAddress
        .toString();
    nokNameController.text =
        context.watch<UserNotifier>().finalUserList.first.nextOfKin.toString();
    nokPhoneController.text =
        context.watch<UserNotifier>().finalUserList.first.NOKPhone.toString();

    return Scaffold(
      backgroundColor: btnColor,
      appBar: appBar('Edit Profile'),
      body: SafeArea(
          child: SingleChildScrollView(
        //tnis is the overall container holding the form
        child: Container(
          decoration: const BoxDecoration(
              color: white,
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(bodyRadius))),
          width: getPercentageWidth(100),
          height: getPercentageHeight(100),
          padding: EdgeInsets.symmetric(horizontal: getPercentageWidth(10)),
          child: Column(
            children: [
              SizedBox(
                height: getPercentageHeight(1),
              ),
              //this is the container for profile picture
              Container(
                height: getPercentageWidth(30),
                width: getPercentageWidth(30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(getPercentageWidth(30)),
                    border: Border.all(
                      width: 1.0,
                      color: btnColor,
                    )),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: SizedBox(
                          width: getPercentageWidth(25),
                          height: getPercentageWidth(25),
                          child: Image.asset(
                            context.watch<UserNotifier>().finalUserList.first.Dp!,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: 37,
                          width: 37,
                          decoration: BoxDecoration(
                              color: btnColor,
                              border: Border.all(width: 3, color: white),
                              borderRadius: BorderRadius.circular(
                                  getPercentageWidth(20))),
                          child: const Icon(
                            Icons.edit_outlined,
                            color: white,
                          ),
                        ))
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
                    'Enter Full Name',
                    style: TextStyle(color: darkText),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 3),
                    width: formInputWidth,
                    padding: const EdgeInsets.only(left: 10),
                    height: formInputHeight,
                    decoration: BoxDecoration(
                        color: formColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(formRadius)),
                    child: TextFormField(
                      controller: fullNameController,

                      keyboardType: TextInputType.text,
                      //obscureText: _isNotVisible?true:false,
                      decoration: _formDecoration('E.g Williams, Frank', true),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getPercentageHeight(1),
              ),
              //this is for phone and date of birth
              SizedBox(
                width: formInputWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Phone',
                          style: TextStyle(color: darkText),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 3),
                          width: formInputWidth / 2.2,
                          padding: const EdgeInsets.only(left: 10),
                          height: formInputHeight,
                          decoration: BoxDecoration(
                              color: formColor.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(formRadius)),
                          child: TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.text,
                            //obscureText: _isNotVisible?true:false,
                            decoration: _formDecoration('0802 XXX XXXX', true),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Date of Birth',
                          style: TextStyle(color: darkText),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 3),
                          width: formInputWidth / 2.2,
                          padding: const EdgeInsets.only(left: 10),
                          height: formInputHeight,
                          decoration: BoxDecoration(
                              color: formColor.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(formRadius)),
                          child: TextFormField(
                            controller: dobController,
                            keyboardType: TextInputType.text,
                            //obscureText: _isNotVisible?true:false,
                            decoration: _formDecoration(dob, true),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getPercentageHeight(1),
              ),
              //gender title

              SizedBox(
                height: getPercentageHeight(1),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Home Address',
                    style: TextStyle(color: darkText),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 3),
                    width: formInputWidth,
                    padding: const EdgeInsets.only(left: 10),
                    height: formInputHeight,
                    decoration: BoxDecoration(
                        color: formColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(formRadius)),
                    child: TextFormField(
                      controller: addressController,
                      keyboardType: TextInputType.text,
                      //obscureText: _isNotVisible?true:false,
                      decoration: _formDecoration('123 Wills Street', true),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getPercentageHeight(1),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Next of Kin',
                    style: TextStyle(color: darkText),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 3),
                    width: formInputWidth,
                    padding: const EdgeInsets.only(left: 10),
                    height: formInputHeight,
                    decoration: BoxDecoration(
                        color: formColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(formRadius)),
                    child: TextFormField(
                      controller: nokNameController,
                      keyboardType: TextInputType.text,
                      //obscureText: _isNotVisible?true:false,
                      decoration: _formDecoration('E.g Mr Jerry Frank', true),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getPercentageHeight(1),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'NOK Phone',
                    style: TextStyle(color: darkText),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 3),
                    width: formInputWidth,
                    padding: const EdgeInsets.only(left: 10),
                    height: formInputHeight,
                    decoration: BoxDecoration(
                        color: formColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(formRadius)),
                    child: TextFormField(
                      controller: nokPhoneController,
                      keyboardType: TextInputType.text,
                      //obscureText: _isNotVisible?true:false,
                      decoration: _formDecoration('0803 XXX XXXX', true),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getPercentageHeight(4),
              ),
              //cancel and save button is here
              SizedBox(
                  width: formInputWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const GeneralBtn(
                          title: 'Cancel',
                          split: true,
                          alternate: true,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          //the provider value is not suitable brcause is in an ummodifiable list
                          //User user =context.watch<UserNotifier>().finalUserList.first;
                          User result = userList
                              .where((element) =>
                                  element.email!.contains(emailController.text))
                              .first;
                          // debugPrint(userList.indexOf(result).toString());
                          int index = userList.indexOf(result);

                          User _user = User(
                              fullName: fullNameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              phone: int.tryParse(phoneController.text),
                              NOKPhone: int.tryParse(nokPhoneController.text),
                              homeAddress: addressController.text,
                              nextOfKin: nokNameController.text,
                              Dp: Provider.of<UserNotifier>(context, listen: false).finalUserList.first.Dp.toString(),
                              dob: dobController.text);

                          context.read<UserNotifier>().editUser(index, _user);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                    sentCurrentPage: 0,
                                  )));

                          // debugPrint(_user.phone.toString());
                          // debugPrint(fullNameController.text);
                          // debugPrint(dobController.text);
                          // debugPrint(addressController.text);
                          // debugPrint(nokNameController.text);
                          // debugPrint(nokPhoneController.text);
                          // debugPrint(nokPhoneController.text);
                        },
                        child: const GeneralBtn(
                          title: 'Save',
                          split: true,
                          alternate: false,
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: getPercentageHeight(3),
              ),
              //or sign in

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

  InputDecoration _formDecoration(String text, bool _pass) {
    return InputDecoration(
      hintText: text,
      hintStyle: const TextStyle(color: formText1),
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
    );
  }
}

class CustomRadioBtn extends StatelessWidget {
  final bool selected;
  final String title;
  const CustomRadioBtn({
    Key? key,
    required this.selected,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.only(top: 3),
            width: formInputWidth / 2.2,
            padding: const EdgeInsets.only(left: 15),
            height: formInputHeight,
            decoration: BoxDecoration(
                color: formColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(formRadius)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(getPercentageWidth(20)),
                      border: Border.all(width: 2, color: btnColor)),
                  child: selected
                      ? const CircleAvatar(
                          radius: 10,
                          backgroundColor: btnColor,
                        )
                      : Container(),
                ),
                SizedBox(
                  width: getPercentageWidth(5),
                ),
                Text(title)
              ],
            )),
      ],
    );
  }
}
