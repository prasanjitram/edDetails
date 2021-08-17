import 'dart:convert';

import 'package:flutter/material.dart';

import 'EducationModel.dart';
import 'Experience.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  GlobalKey <FormState> _key = GlobalKey<FormState>();

  
  Color primary = Color(0xFF6624A6);
  Color card = Color(0xFF3C096C);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFF6624A6), Color(0xFF3C096C)])),
            child: ListView(

              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Hello, Prasanjit".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Calder'),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Education Details'.toUpperCase(),style: TextStyle(
                      fontFamily: 'Calder',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white

                    ),),
                    GestureDetector(onTap: (){
                      showDialog(context: context, builder: (context)=>addEducation(size,true));
                    },
                    child: Icon(Icons.add,color: Colors.white,size: 30,))
                  ],
                ),),
                Container(
                  width: size.width,
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(15),
                  height: size.height*0.35,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: ListView(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        elevation: 20,
                        child: Container(
                          width: size.width,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Color(0xFF6624A6),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        elevation: 20,
                        child: Container(
                          width: size.width,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Color(0xFF6624A6),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        elevation: 20,
                        child: Container(
                          width: size.width,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Color(0xFF6624A6),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        elevation: 20,
                        child: Container(
                          width: size.width,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Color(0xFF6624A6),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Experience'.toUpperCase(),style: TextStyle(
                          fontFamily: 'Calder',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white

                      ),),
                      GestureDetector(onTap: (){
                        showDialog(context: context, builder: (context)=>addExperience(size));
                      },
                          child: Icon(Icons.add,color: Colors.white,size: 30,))
                    ],
                  ),),
                Container(
                  width: size.width,
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(15),
                  height: size.height*0.35,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: ListView(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        elevation: 20,
                        child: Container(
                          width: size.width,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Color(0xFF6624A6),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        elevation: 20,
                        child: Container(
                          width: size.width,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Color(0xFF6624A6),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        elevation: 20,
                        child: Container(
                          width: size.width,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Color(0xFF6624A6),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        elevation: 20,
                        child: Container(
                          width: size.width,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Color(0xFF6624A6),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  AlertDialog addExperience(size){
    TextEditingController titleController = new TextEditingController(),
        experiencetypeController = new TextEditingController(),
        companyController = new TextEditingController(),
        locationController = new TextEditingController(),
        startDateController = new TextEditingController(),
        endDateController = new TextEditingController(),
        descriptionController = new TextEditingController();
    return AlertDialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 20,
    contentPadding: EdgeInsets.all(0),
    content: Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    width: size.width,
    height: size.height*0.55,
    decoration:BoxDecoration(
    color: Color(0xFF3C096C),
    borderRadius: BorderRadius.circular(15)
    ),
      child: Form(
        key: _key,
        child: ListView(
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.white,
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            text('Title', titleController),
            SizedBox(
              height: 10,
            ),
            text('Experience Type', experiencetypeController),
            SizedBox(
              height: 10,
            ),
            text('Company', companyController),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: text('Start Date', startDateController)),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: text('End Date', endDateController),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            text('Description', descriptionController),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (_key.currentState!.validate()) {
                        final obj = Experience(
                          title: titleController.text,
                          experiencetype:
                          experiencetypeController.text,
                          company: companyController.text,
                          location: locationController.text,
                          startDate: startDateController.text,
                          endDate: endDateController.text,
                          description: descriptionController.text,
                        );
                        print(jsonEncode(obj));
                        Navigator.of(context).pop();
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          left: 20, right: 20, top: 25, bottom: 20),
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.6))
                          ]),
                      child: Text(
                        'SAVE',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Calder'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          left: 20, right: 20, top: 25, bottom: 20),
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.6))
                          ]),
                      child: Text(
                        'DELETE',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: 'Calder'),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
 AlertDialog addEducation(size,check){
   TextEditingController collegeController = new TextEditingController(),
       degreeController = new TextEditingController(),
       fieldOfStudyController = new TextEditingController(),
       startDateController = new TextEditingController(),
       endDateController = new TextEditingController(),
       gradeController = new TextEditingController(),
       activitiesController = new TextEditingController(),
       descriptionController = new TextEditingController();
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 20,
      contentPadding: EdgeInsets.all(0),
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: size.width,
        height: size.height*0.7,
        decoration:BoxDecoration(
          color: Color(0xFF3C096C),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Form(
          key: _key,
          child: ListView(
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                      )),

                ],
              ),
              SizedBox(
                height: 10,
              ),
              text('College', collegeController),
              SizedBox(height: 10,),
              text('Degree', degreeController),
              SizedBox(height: 10,),
              text('Field of study', fieldOfStudyController),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                      child: text('Start Date', startDateController)
                  ),
                  SizedBox(width: 20,),
                  Expanded(child: text('End Date', endDateController),)
                ],
              ),
              SizedBox(height: 10,),
              text('Grade', gradeController),
              SizedBox(height: 10,),
              text('Activities', activitiesController),
              SizedBox(height: 10,),
              text('Description', descriptionController),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (_key.currentState!.validate()) {
                          final obj =  EducationModel(college: collegeController.text,
                              degree: degreeController.text,
                              fieldOfStudy: fieldOfStudyController.text,
                              startDate: startDateController.text,
                              endDate: endDateController.text,
                              description: descriptionController.text,
                              grade: (gradeController.text),
                              activities: activitiesController.text);
                          print(jsonEncode(obj));
                          Navigator.of(context).pop();
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin:
                        EdgeInsets.only(
                            left: 20, right: 20, top: 25, bottom: 20),
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.6))
                            ]),
                        child: Text(
                          'SAVE',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Calder'),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        alignment: Alignment.center,
                        margin:
                        EdgeInsets.only(
                            left: 20, right: 20, top: 25, bottom: 20),
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.6))
                            ]),
                        child: Text(
                          'DELETE',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: 'Calder'),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
 }
  TextFormField text(String label, TextEditingController value) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This field can't be empty";
        }
      },
      controller: value,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      decoration: InputDecoration(
          hintText: label,
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primary, width: 5.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primary, width: 3.0),
          ),
          focusColor: primary),
    );
  }
}
