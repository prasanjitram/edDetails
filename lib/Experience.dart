class Experience{
  String title;
  String experiencetype;
  String company;
  String location;
  DateTime startDate;
  DateTime endDate;
  String description;
  Experience({required this.title,
    required this.experiencetype,
    required this.company,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.description});
  Map<String, dynamic> toJson(){
    return{
      "Title": title,
      "Experience Type": experiencetype,
      "Company": company,
      "Location": location,
      "Start Date": {
        "day": startDate.day,
        "month": startDate.month,
        "year": startDate.year,
      },
      "End Date": {
        "day": endDate.day,
        "month": endDate.month,
        "year": endDate.year,
      },
      "Description": description
    };
  }

}