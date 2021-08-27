import 'package:education_details/Personal_Info/widgets/Widgets.dart';
import 'package:flutter/material.dart';

class AddProfile extends StatefulWidget {
  const AddProfile({Key? key}) : super(key: key);

  @override
  _AddProfileState createState() => _AddProfileState();
}

class _AddProfileState extends State<AddProfile> {
  DateTime current = DateTime.now();
  DateTime birthDate = DateTime.now();
  bool birth = true;
  TextEditingController nameController = TextEditingController(),
      phoneController = TextEditingController(),
      institutionController = TextEditingController(),
      addressController = TextEditingController(),
      blogController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(onTap: ()=>Navigator.of(context).pop(),
        child: Icon(Icons.arrow_back,size: 30,color: Colors.black,),),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              addDetail(Icons.person, "Name", nameController),
              addDetail(Icons.phone_android, "Phone No.", phoneController),
              addDetail(Icons.school, "Institution", institutionController),
              addDetail(Icons.web, "Personal Blog", blogController),
              addDetail(Icons.map, 'Address', addressController),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  tileColor: Colors.blue.withOpacity(0.6),
                  leading: Icon(Icons.calendar_today),
                  title: Text(
                    birth
                        ? 'Date Of Birth'
                        : "${birthDate.day}/${birthDate.month}/${birthDate.year}",
                  ),
                  onTap: () {
                    _selectDate(context).then((value) {
                      if (value != DateTime.now()) {
                        setState(() {
                          birth = false;
                          birthDate = value;
                        });
                      } else {
                        setState(() {
                          birth = true;
                        });
                      }
                    });
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buttons('SAVE'),
                  SizedBox(
                    width: 10,
                  ),
                  buttons('CANCEL')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<DateTime> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: birthDate,
        firstDate: DateTime(1800, 1, 1),
        lastDate: DateTime(2200, 12, 31));
    if (picked != null && picked != current)
      return picked;
    else
      return DateTime.now();
  }
}
