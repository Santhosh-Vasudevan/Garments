class User{
  int?id;
  String?fullname;
  String?jobtitle;
  String?skills;
  String?experience;
  String?city;

  userMap(){
    var mapping=Map<String,dynamic>();
    mapping['id']=id??null;
    mapping['fullname']=fullname!;
    mapping['jobtitle']=jobtitle!;
    mapping['skills']=skills!;
    mapping['experience']=experience!;
    mapping['city']=city!;
    return mapping;
  }
}