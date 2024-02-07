import 'package:flutter/material.dart';

import '../widget/leave_widget.dart';
import '../widget/notification_general_widget.dart';
class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  var currentIndex=0;
  List item=[
    'General','Leave','OverTime'
  ];
  List page=[
    ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        primary: false,
        itemBuilder:(context,index){
          return Column(
            children: [
              NotificationGeneral(),
              Divider(
                color: Colors.grey,
              )
            ],
          );
        } ),
    ListView.builder(
      itemCount: 5,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        primary: false,
        itemBuilder:(context,index){
          return LeaveWidget(type: 'notif',);
        } ),
    LeaveWidget(type: 'notif',)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Notification'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.2)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for(var i=0;i<item.length;i++)
                   InkWell(
                     onTap: (){
                       setState(() {
                         currentIndex=i;
                       });
                     },
                     child: Container(
                       width: 85,
                       decoration: BoxDecoration(
                           color:currentIndex==i? Colors.green:Colors.transparent,
                           borderRadius: BorderRadius.circular(5)),
                       child: Center(child: Text(item[i],style: TextStyle(
                           fontSize: 15,
                           fontWeight: FontWeight.bold,
                           color:currentIndex==i? Colors.white:Colors.black),)),

                     ),
                   )
                ],
              ),
            ),
             Expanded(
            child: AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child: page[currentIndex],
            ),
          )

        ],
      ),
    );

  }
}
