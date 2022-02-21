import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:procare_app/size_config.dart';
import 'package:procare_app/theme.dart';
import 'package:procare_app/model/user_model.dart';

const double verticalPadding = 10.0;
const double horizontalPadding = 5.0;
const double skipRadius = 30.0;
const double bodyTextSize = 16.0;
const double mediumTextSize = 20.0;
const double largeTextSize = 26.0;
const double sidePercent = 0.05;
const double bodyRadius = 20.0;
const double formInputHeight = 40.0;
const double formInputWidth = 300.0;
const double formRadius = 6.0;
const double bottomNavIconSize = 28.0;

//icons
const Widget validIcon = Icon(
  Icons.check,
  color: Colors.green,
);
const Widget inValidIcon = Icon(
  Icons.cancel,
  color: Colors.red,
);
const Widget visible = Icon(
  Icons.visibility,
  color: Colors.green,
);
const Widget invisible = Icon(Icons.visibility_off);
const Widget nullIcon = Icon(null);

const skipText = TextStyle(
    fontWeight: FontWeight.bold, fontSize: mediumTextSize, color: white);

const appointmentHeading =
    TextStyle(fontWeight: FontWeight.bold, color: btnColor);
const appointmentBody = TextStyle(color: lightText);

const smallTextStyle = TextStyle(fontSize: bodyTextSize, color: lightText);

double getPercentageHeight(int percentage) {
  return SizeConfig.screenHeight * percentage * 0.01;
}

double getPercentageWidth(int percentage) {
  return SizeConfig.screenWidth * percentage * 0.01;
}

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

//List<Map<String, String>>
List<Map<String, String>> splashData = [
  {
    'image': 'splash1.png',
    'title': 'Protective Eyewear',
    'caption':
        'When shopping for your next pair of sunglasses look for 99-100% UVA and UVB protection'
  },
  {
    'image': 'splash2.png',
    'title': 'Routine Eye Exams',
    'caption':
        'During a comprehensive eye exams, your doctore will check for effect that may lead to vision loss'
  },
  {
    'image': 'splash3.png',
    'title': 'Regular Eye Screening',
    'caption':
        'It  is important to get your vision checked on a regular basis to avoid complications'
  },
];

//List<Map<String, String>>
List<Map<String, dynamic>> circleImages = [
  {
    'image': 'team2.jpg',
    'space': 0,
  },
  {
    'image': 'team4.jpg',
    'space': 23,
  },
  {
    'image': 'team3.jpg',
    'space': 45,
  },
];

List<Map<String, dynamic>> settingDetails = [
  {
    'main': 'Select Theme',
    'sub': 'Switch your app theme',
    'icon': Icons.brightness_medium_sharp
  },
  {'main': 'Password', 'sub': 'Change your password', 'icon': Icons.lock},
  {
    'main': 'Edit Profile',
    'sub': 'update your account',
    'icon': Icons.note_alt_outlined
  },
  {
    'main': 'Logout',
    'sub': 'Sign out of account',
    'icon': Icons.power_settings_new_rounded
  },
];

List<Map<String, dynamic>> supportDetails = [
  {
    'main': 'Terms & Condition',
    'sub': 'Read our T&C',
    'icon': Icons.receipt_long_outlined
  },
  {'main': 'About Us', 'sub': 'Change your password', 'icon': Icons.info},
  {'main': 'Rate Us', 'sub': 'update your account', 'icon': Icons.star},
  {'main': 'App Version', 'sub': 'Sign out of account', 'icon': Icons.apps},
];

List<String> doctors = ['team1.jpg', 'team2.jpg', 'team3.jpg'];

//List<Map<String, String>>
List<Map<String, String>> CTAdetails = [
  {
    'title': 'Checkup',
    'image': 'assets/icons/Artboard 13medIcons.png',
  },
  {
    'title': 'Session',
    'image': 'assets/icons/Artboard 3medIcons.png',
  },
  {
    'title': 'Medication',
    'image': 'assets/icons/Artboard 5medIcons.png',
  },
  {
    'title': 'More',
    'image': 'assets/icons/morepent10.png',
  },
];

List<Map<String, dynamic>> Chat = [
  {'senderID': 1, 'message': 'Hello Doctor Gloria', 'time': '12:03'},
  {'senderID': 2, 'message': 'Hi! thanks for reaching out', 'time': '12:04'},
  {'senderID': 2, 'message': 'how can we be of assistance', 'time': '12:04'},
  {
    'senderID': 1,
    'message': 'I was unable to meetup with my appointment',
    'time': '12:05'
  },
  {
    'senderID': 2,
    'message': 'That won\'t be a problem, you can re shedule',
    'time': '12:05'
  },
  {'senderID': 1, 'message': 'oh! that\'t nice and thanks', 'time': '12:06'},
  {
    'senderID': 2,
    'message': 'you\'re welcome to reach out anytime',
    'time': '12:07'
  },
  {'senderID': 1, 'message': 'thanks once again', 'time': '12:09'},
  {'senderID': 1, 'message': '', 'time': '12:09'},
];

List<Map<String, dynamic>> transactionDetails = [
  {
    'title': 'Purchase of M13 Reading glasses along with custome frame',
    'date': '18 Jan 2021',
    'name': 'Ben Terry',
    'status': true
  },
  {
    'title': 'Session Booking',
    'date': '12 Dec 2020',
    'name': 'Ben Terry',
    'status': true
  },
  {
    'title': 'Eye checkup along side card and medication',
    'date': '04 Nov 2020',
    'name': 'Ben Terry',
    'status': false
  },
  {
    'title': 'Eye checkup along side card and medication',
    'date': '04 Nov 2020',
    'name': 'Ben Terry',
    'status': true
  },
  {
    'title': 'PXGT syrup and Ointment',
    'date': '04 Feb 2020',
    'name': 'Ben Terry',
    'status': true
  },
];

List<Map<String, String>> ActionDetails = [
  {
    'title': 'Appointment',
    'image': 'assets/icons/action1.png',
  },
  {
    'title': 'Contact Us',
    'image': 'assets/icons/action2.png',
  },
  {
    'title': 'Our Services',
    'image': 'assets/icons/action3.png',
  },
  {
    'title': 'About Us',
    'image': 'assets/icons/action4.png',
  },
];

List<String> socials = [
  'assets/svg/twitter.svg',
  'assets/svg/google-icon.svg',
  'assets/svg/facebook-2.svg'
];

List<Color> socialColor = [
  Colors.lightBlueAccent,
  Colors.red,
  Colors.blue,
];

List<String> gender = ["Male", "Female"];

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
      child: Text('Check Up'),
      value: 'checkup',
    ),
    const DropdownMenuItem(
      child: Text('Medication'),
      value: 'medication',
    ),
    const DropdownMenuItem(
      child: Text('Product'),
      value: 'product',
    ),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get country {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("USA"), value: "USA"),
    DropdownMenuItem(child: Text("Canada"), value: "Canada"),
    DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
  ];
  return menuItems;
}

String selectedCountry = 'USA';

final List<User> userProfile = [
  User(
      dob: "12 July, 1992",
      phone: 09034738274,
      email: 'glorimat@gmail.com',
      homeAddress: "12 Marian Road Cal.",
      nextOfKin: "Insp. Frank Edet",
      NOKPhone: 08034543245)
];

final List<String> profileLabel = [
  'Date of Birth',
  'Phone',
  'Email',
  'Home Address',
  'Next of Kin',
  'NOK Phone',
];

final List<dynamic> profileSub = [
  "12 July, 1992",
  09034738274,
  'glorimat@gmail.com',
  '12 Marian Road Cal.',
  'Insp. Frank Edet',
  '08034543245',
];

TextEditingController noteController = TextEditingController();
TextEditingController timeController = TextEditingController();
String selectedValue = 'checkup';
late DateTime currentDate = DateTime.now();
late String startTime = '10:00 AM';

String iconImage(iconImage) {
  if (iconImage == 'checkup') {
    return 'assets/icons/Artboard 13medIcons.png';
  } else if (iconImage == 'medication') {
    return 'assets/icons/Artboard 3medIcons.png';
  } else {
    return 'assets/icons/Artboard 5medIcons.png';
  }
}

List<Map<String, String>> appointmentDetails = [
  {
    'intent': 'Checkup',
    'name': 'Eunice Umana',
    'note':
        'Discription of the reasons for booking this session which can be any reasons',
    'image': 'assets/icons/Artboard 13medIcons.png',
  },
  {
    'intent': 'Medication',
    'name': 'Mike Williams',
    'note':
        'Discription of the reasons for booking this session which can be any reasons',
    'image': 'assets/icons/Artboard 3medIcons.png',
  },
  {
    'intent': 'Product',
    'name': 'Mike Williams',
    'note':
        'Discription of the reasons for booking this session which can be any reasons',
    'image': 'assets/icons/Artboard 5medIcons.png',
  },
  {
    'intent': 'Medication',
    'name': 'Mike Williams',
    'note':
        'Discription of the reasons for booking this session which can be any reasons',
    'image': 'assets/icons/morepent10.png',
  },
];
