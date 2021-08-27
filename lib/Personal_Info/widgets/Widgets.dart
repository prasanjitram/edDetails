import 'package:flutter/material.dart';

import '../Edit Profile.dart';
Widget addDetail(icon, title, controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      tileColor: Colors.blue.withOpacity(0.6),
      leading: Icon(icon),
      title: TextFormField(
          keyboardType:
          title == "Phone No." ? TextInputType.phone : TextInputType.text,
          controller: controller,
          decoration: InputDecoration(
              hintText: title,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none)),
    ),
  );
}

Widget buttons(title,Function function) {
  return Expanded(child: GestureDetector(
    onTap: (){
      function();
    },
    child: Container(
      alignment: Alignment.center,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue.withOpacity(0.8),
      ),
      child: Text(title, style: TextStyle(
          fontSize: 18, color: Colors.black.withOpacity(0.5), fontWeight: FontWeight.bold),),
    ),
  ));
}
Widget editProfile(context){
  return Align(
    alignment: Alignment.centerRight,
    child: InkWell(
      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProfile())),
      child: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          color: Colors.blue.withOpacity(0.6),),

        width: 120,
        height: 40,
        child:Row(
          children: [
            Icon(Icons.edit,size: 20,),
            SizedBox(width: 5,),
            Text('Edit Profile'),
          ],
        ),
      ),
    ),
  );
}
Container personal(icon, title) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12),
    child: ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      leading: Icon(icon),
      title: Text(title),
      tileColor: Colors.blue.withOpacity(0.6),
    ),
  );
}


