import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:procare_app/components/skip_btn.dart';
import 'package:procare_app/constants.dart';
import 'package:procare_app/controller/app_state_notifier.dart';
import 'package:procare_app/routes.dart';
import 'package:procare_app/screens/signin/singin_screen.dart';
import 'package:procare_app/size_config.dart';
import 'package:procare_app/theme.dart';
import 'package:provider/src/provider.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kTransparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: white,
        ),
        actions: [
          _currentPage==2?Container():
          GestureDetector(
              onTap: (){
                context.read<AppStateNotifier>().StartApp();
                irreversibleNavigate(context, const SignInScreen());

              },
              child: SkipBtn()),
          SizedBox(width: MediaQuery.of(context).size.width * sidePercent,)

        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: getPercentageHeight(11)),
            Container(
              margin: EdgeInsets.only(left: getPercentageWidth(13)),
              width: MediaQuery.of(context).size.width,
              height: 350,
              child: PageView.builder(
                  itemCount: 3,
                  onPageChanged: (value){
                    setState(() {
                      _currentPage = value;
                      print(_currentPage);
                    });
                  },
                  itemBuilder: (_, index){
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/splash/'+splashData[index]['image']!, height: 220,),
                      SizedBox(height: getPercentageHeight(5),),
                      SizedBox(
                        width: getPercentageWidth(78),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(splashData[index]['title']!, style: skipText.copyWith(color: transactionText),),
                            SizedBox(height: getPercentageHeight(1),),
                            Text(splashData[index]['caption']!, style: const TextStyle(color: lightText),),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
            SizedBox(height: getPercentageHeight(5)),

          Container(
            width: getPercentageWidth(70),
            child: Row(
              children: [
                ...List.generate(3, (index) =>SplashIndicator(active: _currentPage==index?true:false,))
              ],
            ),
          ),
            SizedBox(height: getPercentageHeight(7)),

            Container(
              width: getPercentageWidth(100),
              child: Row(
                children: [
                  Expanded(child: Container()),
                  _currentPage==2?GestureDetector(
                      onTap: (){
                        context.read<AppStateNotifier>().StartApp();
                        irreversibleNavigate(context, SignInScreen());
                      },
                      child: const GetStartedBtn()):Container(),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}

class GetStartedBtn extends StatelessWidget {
  const GetStartedBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getPercentageWidth(7)
      ),
      height: 55,
      width: getPercentageWidth(84,),
      decoration: const BoxDecoration(
        color: btnColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        )
      ),
      child: Row(
        children: [
         const Text('Get Started',style: skipText,),
          Expanded(child: Container()),
          const Icon(Icons.arrow_forward, color: white,)
        ],
      ),
    );
  }
}

class SplashIndicator extends StatelessWidget {
  final bool active;
  const SplashIndicator({
    Key? key,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      height: 3,
      width: 25,
      color: active?btnColor:lightText,
    );
  }
}
