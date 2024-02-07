
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({super.key});

  @override
  State<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {

  Map<String, double> dataMap = {
    "Web Developer": 18,
    "App Developer": 17,
    "Marketing": 4,
    "Sales": 3,
    "Other": 2,
  };

  List<Color> colorList = [
    const Color(0xffD95AF3),
    const Color(0xff3EE094),
    const Color(0xff3398F6),
    const Color(0xffFA4A42),
    const Color(0xffFE9539)
  ];

  List atten=[
    'Web Developer',
    'App Developer',
    'Marketing',
    'Sales',
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Emoloyees',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
             Padding(
            padding: EdgeInsets.only(left: 15,right: 15),
            child: SizedBox(
              height: size.height*0.35,
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
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  atten[index],
                                  style: TextStyle(color: Colors.black),
                                ),
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
                padding: const EdgeInsets.only(left: 10),
                child: Text('Emoloyees Status',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
              ),
              SizedBox(height: 10,),
              PieChart(
                dataMap: dataMap,
                colorList: colorList,
                chartRadius: 25 / 0.2,
                ringStrokeWidth: 8,
                animationDuration: const Duration(seconds: 3),
                chartValuesOptions: const ChartValuesOptions(
                    showChartValues: true,
                    showChartValuesOutside: true,
                    showChartValuesInPercentage: true,
                    showChartValueBackground: false
                ),
                    legendOptions: const LegendOptions(
                    showLegends: true,
                      legendShape: BoxShape.rectangle,
                    legendTextStyle: TextStyle(fontSize: 15),
                    legendPosition: LegendPosition.right,
                    ),

              ),
        ],
      ),
    );
  }
}
