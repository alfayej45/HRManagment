import 'package:flutter/material.dart';
import 'package:humanresources/screen/attendancepage/attendancepage.dart';
import 'package:humanresources/screen/employeepage/employeepage.dart';
import 'package:humanresources/screen/homepage.dart';
import 'package:humanresources/screen/payrollpage.dart';
import 'package:humanresources/screen/settingpage.dart';

class BottomNaveBarPage extends StatefulWidget {
  const BottomNaveBarPage({super.key});

  @override
  State<BottomNaveBarPage> createState() => _BottomNaveBarPageState();
}

class _BottomNaveBarPageState extends State<BottomNaveBarPage> {
 var bottomIndex=0;
  List bottomIcon=[
    {
      'icon':Icons.home,
      'title':'Home'
    },
    {
      'icon':Icons.paypal,
      'title':'Payroll'
    },
    {
      'icon':Icons.access_time_rounded,
      'title':'Attendance'
    },
    {
      'icon':Icons.person_outline_outlined,
      'title':'Employees'
    },
    {
      'icon':Icons.settings,
      'title':'Setting'
    }
  ];

  List page=[
    HomePage(),
    PayrollPage(),
    Attendance(),
    EmployeesPage(),
    SettingPage()
  ];

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
     bottomNavigationBar: Container(
       height: size.height*0.12,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           for(var i=0;i<bottomIcon.length;i++)
           InkWell(
             onTap: (){
               setState(() {
                 bottomIndex=i;
               });

             },
             child: Column(
               children: [
                 Icon(bottomIcon[i]['icon'],size: 35,color: bottomIndex==i?Colors.redAccent:Colors.black,),
                 Text('${bottomIcon[i]['title']}',
                   style:TextStyle(color: bottomIndex==i?Colors.redAccent:Colors.black) ,
                 )

               ],
             ),
           )
         ],
       ),
     ),
      body: AnimatedSwitcher(
        duration:Duration(seconds: 2),
        child: page[bottomIndex],
      ),
    );
  }
}
