import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  String imagePath =
      "https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_960_720.jpg";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipOval(
          child: Material(
            color: Colors.transparent,
            child: Ink.image(
              image: NetworkImage(imagePath),
              fit: BoxFit.cover,
              alignment: Alignment.center,
              width: 150,
              height: 150,
            ),
          ),
        ),
        Positioned(bottom: 0, right: 10, child: showEdit())
      ],
    );
  }

  Widget showEdit() {
    return ClipOval(

      child: Container(
        padding: EdgeInsets.all(3),
        color: Colors.white,
        child: ClipOval(
          child: Container(
            width: 40,
            height: 40,
            color: Colors.blue,
              child: Icon(
            Icons.edit,
            size: 25,
          )),
        ),
      ),
    );
  }
}
