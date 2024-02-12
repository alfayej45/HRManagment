
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:humanresources/screen/employeepage/add_department.dart';
import 'package:pie_chart/pie_chart.dart';

import 'add_employee.dart';

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({super.key});

  @override
  State<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {

  CustomPopupMenuController controller = CustomPopupMenuController();
  Map<String, double> dataMap = {
    "Web Developer": 18,
    "App Developer": 17,
    "Marketing": 4,
    "Sales": 3,
    "Other": 2,
  };

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;

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
  bool showmenu = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Emoloyees',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CustomPopupMenu(
              menuOnChange: (v){
                print(v);
              },
              controller: controller,
              menuBuilder: () {
                return

                  Container(

                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: IntrinsicWidth(
                      child:
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap:(){
                                print("tap");
                                controller.hideMenu();
                              },
                              child: Text(
                                  'Manage Department',
                                  textAlign:
                                  TextAlign
                                      .start,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black
                                  )
                              ),
                            ),
                            // Container(
                            //   height: 1,
                            //   width: double.infinity,
                            //   color: Colors.black.withOpacity(0.2),
                            // ),
                            // SizedBox(height: 15,),
                            // InkWell(
                            //   onTap:(){
                            //     print("tap");
                            //
                            //     setState(() {
                            //
                            //     });
                            //   },
                            //   child: Text(
                            //       'ডিলিট',
                            //       textAlign:
                            //       TextAlign
                            //           .start,
                            //       style: TextStyle(
                            //           fontSize: 18,
                            //           color: Colors.black
                            //       )),
                            // )
                          ],
                        ),
                      ),
                    ),
                  );

              },
              pressType: PressType.singleClick,
              child:Icon(Icons.more_vert) ,),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed:(){
            employeeAdd();
          },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                 SizedBox(height: 10,),
                 Padding(
                 padding: const EdgeInsets.only(left: 10,right: 15),
                 child: Container(
                   decoration: BoxDecoration(
                     border: Border.all(color: Colors.green),
                   ),
                   child:Column(
                     children: [
                       Container(
                         height: 50,
                         width: double.infinity,
                         decoration: BoxDecoration(
                           border: Border.all(color: Colors.green),
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(
                              padding: const EdgeInsets.only(left: 7),
                               child: Text('Select'),
                             ),
                             InkWell(
                               onTap: (){
                                 setState(() {
                                   showmenu=!showmenu;
                                 });
                               },
                                 child: Icon(Icons.keyboard_arrow_down_rounded))
                           ],
                         ),
                       ),
                        if(showmenu)
                        ListView(
                         shrinkWrap: true,
                         primary: false,
                         children: items.map((e) => Container(
                           decoration: BoxDecoration(
                          //   color: Colors.grey
                            // border: Border.all(color: Colors.green),
                           ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: Text(e),
                          ),
                         )).toList(),
                       )
                     ],
                   ),
                 ),
               ),
             SizedBox(height: 20,),
            //      Padding(
            //       padding: const EdgeInsets.only(left: 10,right: 10),
            //      child: Container(
            //      height: 55,
            //       width: size.width,
            //     // decoration: BoxDecoration(
            //     //     borderRadius: BorderRadius.circular(15),
            //     //     border: Border.all(color:Colors.green)
            //     // ),
            //     child: DropdownButtonHideUnderline(
            //       child: DropdownButton2<String>(
            //         hint: Text(
            //           'Developer',
            //           style: TextStyle(
            //             fontSize: 14,
            //             color: Theme.of(context).hintColor,
            //           ),
            //         ),
            //         items: items
            //             .map((String item) => DropdownMenuItem<String>(
            //           value: item,
            //           child: Text(
            //             item,
            //             style: const TextStyle(
            //               fontSize: 14,
            //             ),
            //           ),
            //         ))
            //             .toList(),
            //         value: selectedValue,
            //         isExpanded: true,
            //         onChanged: (String? value) {
            //           setState(() {
            //             selectedValue = value;
            //           });
            //         },
            //         buttonStyleData:  ButtonStyleData(
            //           padding: EdgeInsets.symmetric(horizontal: 16),
            //           height: 40,
            //           decoration: BoxDecoration(
            //             border: Border.all(color:Colors.green)
            //           )
            //         ),
            //         menuItemStyleData: const MenuItemStyleData(
            //           height: 40,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  employeeAdd() {
    showDialog(
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.22, // Adjust this value as needed
              right: 0,
              left: 0,
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)
                  ),
                ),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: (){
                         Navigator.pop(context);
                         Navigator.push(context, MaterialPageRoute(builder: (_)=>AddDepartment()));
                      },
                      child: Row(
                        children: [
                          Icon(Icons.book),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Add Department',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),

                    Divider(),
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>AddEmployees()));
                      },
                      child: Row(
                        children: [
                          Icon(Icons.person_add_alt_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Add Employee',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    )


                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }


}
