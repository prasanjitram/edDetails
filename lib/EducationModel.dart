class Education{
  String college;
  String degree;
  String fieldOfStudy;
  String startDate;
  String endDate;
  String grade;
  String activities;
  String description;
  Education({required this.college,
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
      "Start Date": startDate,
      "End Date":  endDate,
      "Grade": grade,
      "Activities": activities,
      "Description": description
    };
  }

}