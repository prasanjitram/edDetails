import 'dart:convert';

import 'package:flutter/material.dart';

import 'EducationModel.dart';
import 'Experience.dart';
class Add extends StatefulWidget {
  final Size size;
  final bool check;
  const Add({Key? key, required this.size,this.check=true}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  DateTime current = DateTime.now();
  DateTime expStartDate=DateTime.now();
  DateTime expEndDate=DateTime.now();
  DateTime edStartDate=DateTime.now();
  DateTime edEndDate=DateTime.now();
  Color primary = Color(0xFF6624A6);
  Color card = Color(0xFF3C096C);
  bool expStart = true;
  bool expEnd = true;
  bool edStart = true;
  bool edEnd = true;

  TextEditingController titleController = new TextEditingController(),
      experienceTypeController = new TextEditingController(),
      companyController = new TextEditingController(),
      locationController = new TextEditingController(),
      edStartDateControl = new TextEditingController(),
      edEndDateControl = new TextEditingController(),
      edDescriptionController = new TextEditingController(),
      collegeController = new TextEditingController(),
      degreeController = new TextEditingController(),
      fieldOfStudyController = new TextEditingController(),
      startDateController = new TextEditingController(),
      endDateController = new TextEditingController(),
      gradeController = new TextEditingController(),
      activitiesController = new TextEditingController(),
      descriptionController = new TextEditingController();
  
  Size? size;
  late bool check;
  @override
  void initState() {
    // TODO: implement initState
    size = widget.size;
    check = widget.check;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return check?AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 20,
        contentPadding: EdgeInsets.all(0),
        content: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: size!.width,
          height: size!.height * 0.55,
          decoration: BoxDecoration(
              color: Color(0xFF3C096C),
              borderRadius: BorderRadius.circular(15)),
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
                text('Experience Type', experienceTypeController),
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
                        child: GestureDetector(
                          onTap: () {
                            _selectDate(context).then((value) {
                              if(value!=DateTime.now()){
                                setState(() {
                                  expStart = false;
                                  expStartDate = value;
                                });
                              }
                            });

                          },
                          child: Text(expStart
                              ? 'Start date'
                              : "${expStartDate.day}/${expStartDate.month}/${expStartDate.year}",style: TextStyle(fontSize: 20,color: Colors.white,),),
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap:(){
                          _selectDate(context).then((value) {
                            if(value!=DateTime.now()){
                              setState(() {
                                expEnd = false;
                                expEndDate = value;
                              });
                            }
                          });

                        },
                          child: Text(expEnd
                              ? 'End date'
                              : "${expEndDate.day}/${expEndDate.month}/${expEndDate.year}",style: TextStyle(fontSize: 20,color: Colors.white,),),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                text('Description', edDescriptionController),
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
                              experiencetype: experienceTypeController.text,
                              company: companyController.text,
                              location: locationController.text,
                              startDate: expStartDate,
                              endDate: expEndDate,
                              description: edDescriptionController.text,
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
        )):
    AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 20,
      contentPadding: EdgeInsets.all(0),
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: size!.width,
        height: size!.height * 0.7,
        decoration: BoxDecoration(
            color: Color(0xFF3C096C), borderRadius: BorderRadius.circular(15)),
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
              text('College', collegeController),
              SizedBox(
                height: 10,
              ),
              text('Degree', degreeController),
              SizedBox(
                height: 10,
              ),
              text('Field of study', fieldOfStudyController),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _selectDate(context).then((value) {
                            if(value!=DateTime.now()){
                              setState(() {
                                edStart = false;
                                edStartDate = value;
                              });
                            }
                          });

                        },
                        child: Text(edStart
                            ? 'Start date'
                            : "${edStartDate.day}/${edStartDate.month}/${edStartDate.year}",style: TextStyle(fontSize: 20,color: Colors.white,),),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap:(){
                        _selectDate(context).then((value) {
                          if(value!=DateTime.now()){
                            setState(() {
                              edEnd = false;
                              edEndDate = value;
                            });
                          }
                        });

                      },
                      child: Text(edEnd
                          ? 'End date'
                          : "${edEndDate.day}/${edEndDate.month}/${edEndDate.year}",style: TextStyle(fontSize: 20,color: Colors.white,),),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              text('Grade', gradeController),
              SizedBox(
                height: 10,
              ),
              text('Activities', activitiesController),
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
                          final obj = EducationModel(
                              college: collegeController.text,
                              degree: degreeController.text,
                              fieldOfStudy: fieldOfStudyController.text,
                              startDate: edStartDate,
                              endDate: edEndDate,
                              description: descriptionController.text,
                              grade: (gradeController.text),
                              activities: activitiesController.text);
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
  Future<DateTime> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: current,
        firstDate: DateTime(1800, 1, 1),
        lastDate: DateTime(2200, 12, 31));
    if (picked != null && picked != current)
      return picked;
    else
      return DateTime.now();
  }
}
