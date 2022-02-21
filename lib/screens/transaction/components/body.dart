import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:procare_app/components/general_btn.dart';

import '../../../constants.dart';
import '../../../theme.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: background,
        ),
        backgroundColor: background,
        title: Text('Transaction', style: skipText.copyWith(color: transactionText),),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: transactionText, size: 30,),
            onPressed: () {},
          ),
          SizedBox(width: getPercentageWidth(2),)
        ],
      ),
      body: SafeArea(
       child: Column(
         children: [
           Container(
             width: getPercentageWidth(90),
             height: getPercentageHeight(8),
             padding: EdgeInsets.all(getPercentageWidth(2),),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(15),
               color: formColor.withOpacity(0.5)
             ),
             child: Row(
               children: [
                 Expanded(child: ProgressCard(done: true,)),
                 Expanded(child: ProgressCard(done: false,)),
               ],
             ),
           ),
           SizedBox(height: getPercentageHeight(5),),
           Container(
             height: getPercentageHeight(64),
             width: getPercentageWidth(100),
             margin: EdgeInsets.only(
             left: getPercentageWidth(5),
             right: getPercentageWidth(5)),
             //color: Colors.red,
             child: ListView.builder(
                 itemCount: transactionDetails.length,
                 itemBuilder: (_, index){
               return TransCard(done: transactionDetails[index]['status'], transDetails: transactionDetails[index]);
             })
           )
         ],
       ),
      ),

    );

  }
}


class TransCard extends StatelessWidget {
  final bool done;
  final Map <String, dynamic> transDetails;
  const TransCard({
    Key? key, required this.done, required this.transDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: getPercentageHeight(10),
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.only(bottom: 12),
      decoration: const BoxDecoration(
        //color: Colors.green,
          border: Border(bottom: BorderSide(color: lightText, width: 0.7))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: getPercentageWidth(60),
                child: Text(
                    transDetails['title'],
                  style: TextStyle(fontWeight: FontWeight.bold, color: transactionText.withOpacity(0.7)),
                ),
              ),
              SizedBox(height: getPercentageHeight(1),),
              Text("${transDetails['date']}" +" . "+ "${transDetails['name']}", style: TextStyle(color: formText1, fontSize: 12, fontWeight: FontWeight.bold),)
            ],
          ),
           Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text('\$120.00', style: TextStyle(color: done?completed:failed, fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }
}

class ProgressCard extends StatelessWidget {
  final bool done;
  const ProgressCard({
    Key? key,
    required this.done,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: done?background:null
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
           // padding: EdgeInsets.all(10),
            child: Icon(done?Icons.check:Icons.close, color: white, size: 15,),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: done?completed:failed
            ),
          ),
          SizedBox(width: getPercentageWidth(3),),
          done?Text('Success'):Text('Failed')
        ],),
      ),

    );
  }
}



