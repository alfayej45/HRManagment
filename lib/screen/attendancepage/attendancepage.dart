import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:humanresources/screen/attendancepage/not_cloclkpage.dart';
import 'package:humanresources/screen/notification/notification.dart';

import '../widget/clock_in_widget.dart';
import 'leavepage.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  List atten=[
    'Not Clock in yet(5)',
    'Clock In',
    'Leave',
    'Break',
    'Overtime',
    'Clock Out'
  ];
  List<double> lateEmployeesData = [2, 5, 1, 6, 3, 4, 2, 7, 5, 3];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Attendance',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>NotificationPage()));

              },
                child: Icon(Icons.notifications)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: SizedBox(
                height: size.height * 0.55,
                child: GridView.builder(
                    itemCount: atten.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 6,
                        childAspectRatio: 1.6),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          if(index==0){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>NotClockPage()));
                          }
                          else if(index==1){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>ClockInWidget()));
                          }else if(index==2){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>LeavePage()));
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.redAccent)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, top: 3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  atten[index],
                                  style: TextStyle(color: Colors.black),
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 18,
                                      backgroundImage:
                                          AssetImage('images/images.jpg'),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    CircleAvatar(
                                      radius: 18,
                                      backgroundImage:
                                          AssetImage('images/images.jpg'),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: SizedBox(
                height: size.height * 0.35,
                child: GridView.builder(
                    itemCount: 4,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 6,
                        childAspectRatio: 1.6),
                    itemBuilder: (context, index) {
                      return Container(
                        height: size.height * 0.15,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.grey)),
                                child: Center(
                                  child: Icon(Icons.person_add_alt_outlined,size: 18,),
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    SizedBox(
                                      height: 50,
                                      width: 60,
                                      child: LineChart(
                                        LineChartData(
                                          gridData: FlGridData(show: false),
                                          titlesData: FlTitlesData(show: false),
                                          borderData: FlBorderData(
                                            show: false,
                                            // Remove outer border
                                          ),
                                          minX: 0,
                                          maxX: lateEmployeesData.length.toDouble() - 1,
                                          minY: 0,
                                          maxY: lateEmployeesData.reduce(
                                                  (value, element) =>
                                              value > element ? value : element) +
                                              2,
                                          lineBarsData: [
                                            LineChartBarData(
                                              spots: lateEmployeesData
                                                  .asMap()
                                                  .entries
                                                  .map((entry) {
                                                return FlSpot(
                                                    entry.key.toDouble(), entry.value);
                                              }).toList(),
                                              isCurved: true,
                                              color: Colors.green,
                                              barWidth: 1,
                                              dotData: FlDotData(show: false),
                                              isStrokeCapRound: true,
                                              belowBarData: BarAreaData(
                                                  color: Colors.green.withOpacity(0.1),
                                                  show: true),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width:5,),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Text(
                                        '12.8%',
                                        style: TextStyle(fontSize: 14, color: Colors.green,fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  width: 110,
                                  child: Text(
                                    'Employees Attendance',
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  width: 110,
                                  child: Text(
                                    'Increased vs last month',
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    style: TextStyle(fontSize: 12, color: Colors.grey,fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
