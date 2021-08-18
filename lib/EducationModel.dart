class EducationModel{
  String college;
  String degree;
  String fieldOfStudy;
  DateTime startDate;
  DateTime endDate;
  String grade;
  String activities;
  String description;
  EducationModel({required this.college,
  required this.degree,
  required this.fieldOfStudy,
  required this.startDate,
  required this.endDate,
  required this.grade,
  required this.activities,
  required this.description});
  Map<String, dynamic> toJson(){
    return{
      "College": college,
      "Degree": degree,
      "Field Of Study": fieldOfStudy,
      "Start Date": {
        "day": startDate.day,
        "month": startDate.month,
        "year": startDate.year
      },
      "End Date": {
        "day": endDate.day,
        "month": endDate.month,
        "year": endDate.year
      },
      "Grade": grade,
      "Activities": activities,
      "Description": description
    };
  }

}