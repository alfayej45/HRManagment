import 'package:flutter/material.dart';
import 'package:humanresources/screen/widget/leave_widget.dart';
import 'package:readmore/readmore.dart';

class LeavePage extends StatefulWidget {
  const LeavePage({super.key});
  @override
  State<LeavePage> createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leave'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           ListView.builder(
             itemCount: 3,
               shrinkWrap: true,
               primary: false,
               itemBuilder: (context,index){
               return LeaveWidget(type: 'atte',);
               })
          ],
        ),
      ),
    );
  }
}
