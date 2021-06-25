import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets/homePage/homePage.dart';
import 'package:pets/loginPage/newAccount.dart';

import 'package:sqflite/sqflite.dart';
import 'package:pets/database/db_helper.dart';
import 'package:pets/models/User.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final dbHelper = DatabaseHelper.instance;
  List<User> users=[];
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Neşeli Yürüyüşler"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 150, right: 20, left: 20),
        child: ListView(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: "Kullanıcı Adı",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            SizedBox(height: 35),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Şifre",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () async{
                    String username=usernameController.text;
                    String password=passwordController.text;
                     await _insert(username,password);
                     Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => HomePage()));
                  },
                  child: Container(
                    width: 120,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        "Giriş",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => NewAccount()));
                  },
                  child: Text(
                    "Yeni Hesap Oluştur",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _insert(String username, String password) async{
     Map<String, dynamic> row={
      DatabaseHelper.columnUsername:username,
      DatabaseHelper.columnPassword:password,
    };

    User user=User.fromMap(row);

   
    //final id=await dbHelper.insert(user);
    //print("inserted id : $id");
  
  }

  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    allRows.forEach((row) => users.add(User.fromMap(row)));
    
  }

}
