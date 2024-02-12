import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
class AddDepartment extends StatefulWidget {
  const AddDepartment({super.key});
  @override
  State<AddDepartment> createState() => _AddDepartmentState();
}

class _AddDepartmentState extends State<AddDepartment> {
  var selectedValue;
  var selectedValue2;

   List<String> items=[
    'Yes',
    'NO'
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(selectedValue);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            'ADD New Department',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Department NAME',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)
            ),
            SizedBox(height: 5,),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffd9d9d9)),
                color: Colors.grey.withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0,),
                child: TextField(
                 // controller: controller.emailControllar,
                  decoration: InputDecoration(
                    hintText: "Department Name",
                    border:InputBorder.none,
                    hintStyle:   TextStyle(
                      color: Colors.grey,
                      fontFamily: 'IrabotiMJ',
                      fontWeight: FontWeight.normal,

                    ),
                  ),
                ),
              ),
            ),
            Text(
                'Late Penalty',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)
            ),
            SizedBox(height: 5,),
            Container(
                 height: 55,
                  width: size.width,
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(15),
                //     border: Border.all(color:Colors.green)
                // ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    hint: Text(
                      'Yes',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: items
                        .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                        .toList(),
                    value: selectedValue,
                    isExpanded: true,
                    onChanged: (String? value) {
                      setState(() {
                        selectedValue = value;

                      });
                    },
                    buttonStyleData:  ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),

                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffd9d9d9)),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.12),
                      )
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),
                  ),
                ),
              ),
            SizedBox(height: 5,),
            Text(
                'Work Pattern',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)
            ),
            SizedBox(height: 5,),
            Container(
              height: 55,
              width: size.width,
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(15),
              //     border: Border.all(color:Colors.green)
              // ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  hint: Text(
                    'Yes',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: items
                      .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
                      .toList(),
                  value: selectedValue2,
                  isExpanded: true,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue2 = value;

                    });
                  },
                  buttonStyleData:  ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffd9d9d9)),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.12),
                      )
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Text(
                'Supervisor',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)
            ),
            SizedBox(height: 5,),
            Container(
              height: 55,
              width: size.width,
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(15),
              //     border: Border.all(color:Colors.green)
              // ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  hint: Text(
                    'Yes',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: items
                      .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
                      .toList(),
                  value: selectedValue2,
                  isExpanded: true,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue2 = value;

                    });
                  },
                  buttonStyleData:  ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffd9d9d9)),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.12),
                      )
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    width: 110,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green.withOpacity(0.2)
                    ),
                    child: Center(
                      child: Text(
                          'Cancle',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black)
                      ) ,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 110,
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green
                    ),
                    child: Center(
                      child: Text(
                          'Save',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white)
                      ) ,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
