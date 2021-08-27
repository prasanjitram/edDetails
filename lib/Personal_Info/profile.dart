import 'package:education_details/Personal_Info/Details.dart';
import 'package:education_details/Personal_Info/Edit%20Profile.dart';
import 'package:education_details/Personal_Info/Picture.dart';
import 'package:education_details/Personal_Info/widgets/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Personal extends StatefulWidget {
  const Personal({Key? key}) : super(key: key);

  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(child: ProfilePicture()),
            SizedBox(
              height: 25,
            ),
            editProfile(context),
            personal(Icons.person, "Prasanjit Ram"),
            SizedBox(
              height: 10,
            ),
            personal(Icons.email, "prasanjitram34@gmail.com"),
            Details()
          ],
        ),
      ),
    );
  }


}
