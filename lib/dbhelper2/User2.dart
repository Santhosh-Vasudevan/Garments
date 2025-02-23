class User2{
  int?id;
  String?fullname;
  String?jobtitle;
  String?skills;
  String?experience;
  String?city;
  String?number;
  String?gender;
  String?costdays;


  userMap2(){
    var mapping=Map<String,dynamic>();
    mapping['id']=id??null;
    mapping['fullname']=fullname!;
    mapping['jobtitle']=jobtitle!;
    mapping['skills']=skills!;
    mapping['experience']=experience!;
    mapping['city']=city!;
    mapping['number']=number!;
    mapping['gender']=gender!;
    mapping['costdays']=costdays!;
    return mapping;
  }
}