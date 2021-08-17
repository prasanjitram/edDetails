import 'dart:convert';

import 'package:education_details/EducationModel.dart';
import 'package:education_details/Profile.dart';
import 'package:flutter/material.dart';
// Amplify Flutter Packages
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
// import 'package:amplify_api/amplify_api.dart'; // UNCOMMENT this line after backend is deployed

// Generated in previous step
import 'models/ModelProvider.dart';
import 'amplifyconfiguration.dart';

void main() {
  runApp(MaterialApp(home: Profile(),));
}

class EdDetails extends StatefulWidget {
  const EdDetails({Key? key}) : super(key: key);

  @override
  _EdDetailsState createState() => _EdDetailsState();
}

class _EdDetailsState extends State<EdDetails> {
  bool _amplifyConfigured = false;
  Color primary = Color(0xFF6624A6);
  Color card = Color(0xFF3C096C);
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _configureAmplify();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return
      Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                color: primary,
              ),
              child: !_amplifyConfigured?CircularProgressIndicator(color: Colors.white,):ListView(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                      child: Text(
                        'Education Details',
                        style: TextStyle(
                            fontFamily: 'Calder',
                            color: Colors.white,
                            fontSize: 30),
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: size.width,
                    height: 100,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: card,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 20,
                              color: Colors.black.withOpacity(0.6))
                        ]),
                  )
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: InkWell(
          onTap: () {
            alert(size);
          },
          child: Hero(
            tag: 'alert',
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: card,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 20,
                        color: Colors.black.withOpacity(0.6))
                  ]),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ),
      );
  }

  void alert(size) {
    TextEditingController collegeController = new TextEditingController(),
    degreeController = new TextEditingController(),
        fieldOfStudyController = new TextEditingController(),
        startDateController = new TextEditingController(),
        endDateController = new TextEditingController(),
        gradeController = new TextEditingController(),
        activitiesController = new TextEditingController(),
        descriptionController = new TextEditingController();
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return Scaffold(
            backgroundColor: Colors.white.withOpacity(0.08),
            body: Hero(
              tag: 'alert',
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 110),
                decoration: BoxDecoration(
                    color: card,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.6))
                    ]),
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
            ),
          );
        }));
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
  void _configureAmplify() async {

    // await Amplify.addPlugin(AmplifyAPI()); // UNCOMMENT this line after backend is deployed
    await Amplify.addPlugin(AmplifyDataStore(modelProvider: ModelProvider.instance));

    // Once Plugins are added, configure Amplify
    await Amplify.configure(amplifyconfig);
    try {
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }
}
