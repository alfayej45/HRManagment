import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
class AddEmployees extends StatefulWidget {
  const AddEmployees({super.key});

  @override
  State<AddEmployees> createState() => _AddEmployeesState();
}

class _AddEmployeesState extends State<AddEmployees> {
  var selectedValue;
  var selectedValue2;
  var selectedValue3;

  DateTime? agedate;

  List<String> items=[
    'Mobile App',
    'Web Develiper',
    'Merketing'
  ];
  List<String> genders=[
   'Male',
    'Female'
  ];
  File? imagepath;
  String? pdfPath;
  ImagePicker picker=ImagePicker();

  age(){
    if(agedate==null)
      {
        return 'Date of Birth';
      }
    else{
      String formattedDate = DateFormat('MMMM d, yyyy').format(agedate!);
      return formattedDate;
    //  return '${agedate!.month}-${agedate!.day}-${agedate!.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ADD Employees',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Align(
                 alignment: Alignment.center,
                 child: Stack(
                   children: [
                     imagepath != null ?  CircleAvatar(
                       radius: 55,
                       backgroundColor: Colors.greenAccent,
                       backgroundImage:  FileImage(imagepath!),
                     ):
                     CircleAvatar(
                       radius: 55,
                     // backgroundColor: Colors.greenAccent,
                       backgroundImage: AssetImage('images/parson.png'),
                     ),
                     InkWell(
                       onTap: (){
                         picImage();
                       },
                       child: Padding(
                           padding: EdgeInsets.only(
                               top: 81,
                               left: 82
                           ),
                           child: Container(
                             height: 20,
                             width: 20,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(5),
                               color: Colors.greenAccent
                             ),
                             child: Center(
                               child: Icon(Icons.edit,size: 15,color: Colors.black,),
                             ),
                           )),
                     )
                   ],
                 ),
               ),

              Text(
                  'Full NAME',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)
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
                      hintText: "Full Name",
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
                  'Position',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)
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
                      hintText: "Positions",
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
                  'Employee Status',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)
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
                      'Employee Status',
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
              Text(
                  'Department',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)
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
                      'Department',
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
              Text(
                  'Gender',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)
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
                      'Gender',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: genders.map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                        .toList(),
                    value: selectedValue3,
                    isExpanded: true,
                    onChanged: (String? value) {
                      setState(() {
                        selectedValue3 = value;
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
              Text(
                'Date of Birth',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 5,),
              Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffd9d9d9)),
                  color: Colors.grey.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          age(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal)
                      ),
                      InkWell(
                        onTap: ()async{
                        DateTime? result= await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2010),
                              lastDate: DateTime(2025));
                       if(result !=null)
                         {
                           setState(() {
                             agedate=result;
                           });
                         }
                        },
                          child: Icon(Icons.calendar_month))
                    ],
                  ),
                ),
              ),
              Text(
                  'Phone Number',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 5,),
              Container(
               // height: 50,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffd9d9d9)),
                  color: Colors.grey.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:IntlPhoneField(
                  decoration: InputDecoration(

                    border:InputBorder.none,
                    hintStyle:   TextStyle(
                      color: Colors.grey,
                      fontFamily: 'IrabotiMJ',
                      fontWeight: FontWeight.normal,
                    ),
                  ),

                  initialCountryCode: 'BD',
                  disableLengthCheck: true,
                  //disableAutoFillHints: true,
                  onChanged: (phone) {
                    print('Phone number:${phone.completeNumber}');

                  },
                )
              ),
              Text(
                  'EMAIL',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)
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
                      hintText: "Email",
                      border:InputBorder.none,
                      hintStyle:   TextStyle(
                        color: Colors.grey,
                        fontFamily: 'IrabotiMJ',
                        fontWeight: FontWeight.normal,
                        
                      ),
                      prefixIcon: Icon(Icons.email_outlined,color: Colors.black,)
                    ),
                  ),
                ),
              ),
              Text(
                  'Employees Identification document',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)
              ),
              SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: (){
                  pickFile();
                },
                child: Container(
                  height: 65,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffd9d9d9)),
                    color: Colors.grey.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0,),
                    child: Center(
                      child:pdfPath !=null?Text('${pdfPath}'): Icon(Icons.file_upload_outlined),
                    )
                  ),
                ),
              ),

              Text(
                  'Start date Employee',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 5,),
              Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffd9d9d9)),
                  color: Colors.grey.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          age(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal)
                      ),
                      InkWell(
                          onTap: ()async{
                            DateTime? result= await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2010),
                                lastDate: DateTime(2025));
                            if(result !=null)
                            {
                              setState(() {
                                agedate=result;
                              });
                            }
                          },
                          child: Icon(Icons.calendar_month))
                    ],
                  ),
                ),
              ),

              Text(
                  'Emergency Contact Name',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)
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
                      hintText: "Full Name",
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
                  'Phone Number',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 5,),
              Container(
                // height: 50,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffd9d9d9)),
                    color: Colors.grey.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:IntlPhoneField(
                    decoration: InputDecoration(

                      border:InputBorder.none,
                      hintStyle:   TextStyle(
                        color: Colors.grey,
                        fontFamily: 'IrabotiMJ',
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    initialCountryCode: 'BD',
                    disableLengthCheck: true,
                    //disableAutoFillHints: true,
                    onChanged: (phone) {
                      print('Phone number:${phone.completeNumber}');

                    },
                  )
              ),
              
              Row(
                children: [
                  Text(
                      'login Account',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.grey)
                  ),
                  SizedBox(width: 5,),
                  Expanded(child: Divider())
                ],
              ),
              SizedBox(height: 10,),
              Text(
                  'Email',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)
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
                      hintText: "Email",
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
                  'Password',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)
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
                      hintText: "Password",
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
                  'Confirm password',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 5),
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
                      hintText: "Confirm password",
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
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
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
              SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    );
  }

  Future imagePickerMethodGallery(ImageSource source) async {
    final pick = await picker.pickImage(source: source);
    setState(() {
      if (pick != null) {
        imagepath = File(pick.path);
        print(imagepath);
        Navigator.pop(context);
      } else {
      //  showSnackBar("No File selected", Duration(milliseconds: 400));
      }
    });
  }

  picImage(){
    showDialog(context: context, builder: (context)
    {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10)
          ),
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [

            InkWell(
              onTap: (){
                imagePickerMethodGallery(ImageSource.gallery);
              },
              child: Container(
                height: 50,
                width: 110,
                decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green.withOpacity(0.2)
                ),
                child: Center(
                  child: Text(
                      'Gallery',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black)
                  ) ,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: (){
                imagePickerMethodGallery(ImageSource.camera);
              },
              child: Container(
                height: 50,
                width: 110,
                decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green.withOpacity(0.2)
                ),
                child: Center(
                  child: Text(
                      'Camera',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black)
                  ) ,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
  Future<void> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        PlatformFile file = result.files.first;
        setState(() {
          pdfPath=file.name;
        });

        // Handle the selected PDF file, e.g., upload it to a server, process it, etc.
        print('Selected file: ${file.path}');
      } else {
        // User canceled the file picking.
        print('File picking canceled.');
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }


}
