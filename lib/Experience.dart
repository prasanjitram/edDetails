class Experience{
  String title;
  String experiencetype;
  String company;
  String location;
  String startDate;
  String endDate;
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
      "Start Date": startDate,
      "End Date":  endDate,
      "Description": description
    };
  }

}