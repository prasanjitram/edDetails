import 'dart:convert';

import 'package:education_details/Alert.dart';
import 'package:flutter/material.dart';

import 'EducationModel.dart';
import 'Experience.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  DateTime current = DateTime.now();
  DateTime? selectedDate;

  Color primary = Color(0xFF6624A6);
  Color card = Color(0xFF3C096C);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
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
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Education Details'.toUpperCase(),
                        style: TextStyle(
                            fontFamily: 'Calder',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => Add(
                                      size: size,
                                      check: false,
                                    ));
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ))
                    ],
                  ),
                ),
                Container(
                  width: size.width,
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(15),
                  height: size.height * 0.35,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListView(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 20,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: size.width,
                            decoration: BoxDecoration(
                                color: Color(0xFF6624A6),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'College: CET',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                                text('Degree: BTech'),
                                text('Field of study: Engineering'),
                                text('Start Date: Day/Month/Year'),
                                text('End Date: Day/Month/Year'),
                                text('Grade: 9.5'),
                                text('Activities: Anything'),
                                text('Description: Anything')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Experience'.toUpperCase(),
                        style: TextStyle(
                            fontFamily: 'Calder',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => Add(size: size));
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ))
                    ],
                  ),
                ),
                Container(
                  width: size.width,
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(15),
                  height: size.height * 0.35,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListView(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 20,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: size.width,
                            decoration: BoxDecoration(
                                color: Color(0xFF6624A6),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Title: Intern',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                                text('Experience type: Anything'),
                                text('Company: Preppalz'),
                                text('Location: BBSR'),
                                text('Start Date: Day/Month/Year'),
                                text('End Date: Day/Month/Year'),
                                text('Description: Anything'),
                              ],
                            ),
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
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Preppalz'),
              decoration: BoxDecoration(color: primary),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile())),
            )
          ],
        ),
      ),
    );
  }

  Text text(String entry) {
    return Text(
      entry,
      style: TextStyle(color: Colors.white, fontSize: 15),
      overflow: TextOverflow.ellipsis,
    );
  }
}
