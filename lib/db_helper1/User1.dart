class Userjob{
  int?id;
  String?name;
  String?number;
  String?email;
  String?skills;


  userMap(){
    var mapping=Map<String,dynamic>();
    mapping['id']=id??null;
    mapping['name']=name!;
    mapping['number']=number!;
    mapping['email']=email!;
    mapping['skills']=skills!;
    return mapping;

  }
}