import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:procare_app/components/circle_icon.dart';
import 'package:procare_app/components/circle_image.dart';
import 'package:procare_app/components/home_app_bar.dart';
import 'package:procare_app/controller/user_notifier.dart';
import 'package:procare_app/screens/about/about_screen.dart';
import 'package:procare_app/screens/appointments/appointment_screen.dart';
import 'package:procare_app/screens/chat/chat_screen.dart';
import 'package:procare_app/screens/home/home_screen.dart';
import 'package:procare_app/theme.dart';
import 'package:provider/src/provider.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: homeAppBar(context, true),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: getPercentageWidth(91),
                height: getPercentageHeight(16),
                decoration: BoxDecoration(
                    color: btnColor,
                    borderRadius: BorderRadius.circular(formRadius)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircledIcon(),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Today's Eye Care Tips",
                              style: skipText.copyWith(fontSize: 15),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 5, top: 5),
                              height: getPercentageHeight(5),
                              width: getPercentageWidth(60),
                              child: Text(
                                "Good eye care starts with food on your plate. Nutrient",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: 13,
                                    color: white.withOpacity(0.8)),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          '120K people are subscribed to this',
                          style: TextStyle(color: white),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 35,
                            child: Center(
                              child: Stack(
                                children: [
                                  const SizedBox(
                                    height: 35,
                                    width: 80,
                                  ),
                                  ...List.generate(
                                    3,
                                    (index) => Positioned(
                                      left: circleImages[index]['space']
                                          .toDouble(),
                                      child: CircledImages(
                                        image: 'assets/images/' +
                                            circleImages[index]['image'],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            //CTA checkup, session, medication, more
            Container(
              width: getPercentageWidth(90),
              height: getPercentageHeight(13),
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CTA(
                      image: CTAdetails[0]['image']!,
                      title: CTAdetails[0]['title']!,
                    ),
                    CTA(
                      image: CTAdetails[1]['image']!,
                      title: CTAdetails[1]['title']!,
                    ),
                    CTA(
                      image: CTAdetails[2]['image']!,
                      title: CTAdetails[2]['title']!,
                    ),
                    CTA(
                      image: CTAdetails[3]['image']!,
                      title: CTAdetails[3]['title']!,
                    ),
                  ]),
            ),
            //Doctors label
            const Separator(title: 'Doctors'),
            //Spacing befor doctors card
            SizedBox(
              height: getPercentageHeight(1),
            ),
            //DoctorsCard()
            Container(
              width: getPercentageWidth(100),
              padding: EdgeInsets.only(left: getPercentageWidth(5)),
              height: 89,
              child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return DoctorsCard(
                      doctDetails: appointmentDetails[index]
                    );
                  }),
            ),
            SizedBox(
              height: getPercentageHeight(1),
            ),
            const Separator(title: 'Actions'),
            SizedBox(
              height: getPercentageHeight(1),
            ),
            //this is where the appointment, contact us, our service and about us cards are.
            SizedBox(
              //color: Colors.red,
              height: getPercentageHeight(26),
              width: getPercentageWidth(90),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 10,
                childAspectRatio: 1.6 / 1,
                shrinkWrap: true,
                children: [
                  GestureDetector(
                      onTap: () {
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AppointmentScreen()));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const HomeScreen(sentCurrentPage: 1)));
                      },
                      child: ActionCard(
                        title: ActionDetails[0]['title']!,
                        icon: ActionDetails[0]['image']!,
                        invert: false,
                      )),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ChatScreen.routeName);
                      },
                      child: ActionCard(
                        title: ActionDetails[1]['title']!,
                        icon: ActionDetails[1]['image']!,
                        invert: true,
                      )),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutScreen(
                                      altTile: "Our Services",
                                    )));
                      },
                      child: ActionCard(
                        title: ActionDetails[2]['title']!,
                        icon: ActionDetails[2]['image']!,
                        invert: true,
                      )),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AboutScreen.routeName);
                      },
                      child: ActionCard(
                        title: ActionDetails[3]['title']!,
                        icon: ActionDetails[3]['image']!,
                        invert: true,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final String title;
  final String icon;
  final bool invert;
  const ActionCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.invert,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: invert ? white : btnColor,
        border: Border.all(width: 1.0, color: btnColor),
        borderRadius: BorderRadius.circular(formRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            icon,
            scale: 4.5,
            color: invert ? btnColor : white,
          ),
          Text(
            title,
            style: TextStyle(
                color: invert ? btnColor : white, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

class Separator extends StatelessWidget {
  final String title;
  const Separator({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getPercentageWidth(100),
      height: 30,
      padding: EdgeInsets.only(left: getPercentageWidth(6)),
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: [
          Text(
            title,
            style: skipText.copyWith(
                fontSize: 16, color: darkText, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class DoctorsCard extends StatelessWidget {
  final Map<String, String> doctDetails;
  const DoctorsCard({
    Key? key,
    required this.doctDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, top: 10),
      width: getPercentageWidth(70),
      margin: const EdgeInsets.only(right: 10),
      height: getPercentageHeight(10),
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircledImages(
            image: doctDetails['image']!,
            line: false,
            radius: 40,
          ),
          SizedBox(
            width: getPercentageWidth(7),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctDetails['name']!,
                style: skipText.copyWith(fontSize: 15, color: nearBlack),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                'Opthamologist Specialist',
                style: TextStyle(color: lightText),
              ),
              const SizedBox(
                height: 4,
              ),
              Wrap(
                children: [
                  ...List.generate(
                      5,
                      (index) => const Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.orange,
                          ))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class CTA extends StatelessWidget {
  final String image;
  final String title;

  const CTA({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: getPercentageWidth(17),
          width: getPercentageWidth(17),
          margin: const EdgeInsets.only(bottom: 5),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(formRadius),
            color: white,
          ),
          child: Image.asset(image),
        ),
        Text(
          title,
          style: const TextStyle(color: caption),
        )
      ],
    );
  }
}
