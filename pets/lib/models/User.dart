import 'package:pets/database/db_helper.dart';

class User{
  int id;
  String username;
  String password;

  User(this.id,this.username,this.password);

  User.fromMap(Map<String, dynamic> map){
    this.id=map['id'];
    this.username=map['username'];
    this.password=map['password'];
  }

  Map<String, dynamic> toMap()
  {
    return{
        DatabaseHelper.columnId : this.id,
        DatabaseHelper.columnUsername : this.username,
        DatabaseHelper.columnPassword : this.password,
    };
   /* var map = Map<String, dynamic>(); //Geçici bir map nesnesi
    map["id"] = id;
    map["username"] = username;
    map["password"] = password;
    return map; */
  }

}