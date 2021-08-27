import 'package:flutter/material.dart';
class Details extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(

        decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.6),
            borderRadius: BorderRadius.circular(20)
        ),
        child: Container(padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About:-",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              Text("Personal Blog:-"),
              Text("Phone Number:-"),
              Text("Address:-"),
              Text("Date of Birth:-"),
              SizedBox(height: 8,)
            ],
          ),
        ),
      ),
    )
    ;
  }
}
