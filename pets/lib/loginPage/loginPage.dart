import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets/homePage/homePage.dart';
import 'package:pets/loginPage/newAccount.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Neşeli Yürüyüşler"),
        centerTitle: true,
      ),
      body: loginUser(context),
    );
  }
}

Widget loginUser(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 150, right: 20, left: 20),
    child: ListView(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "E-Posta",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        ),
        SizedBox(height: 35),
        TextField(
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
              onTap: () {
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
  );
}
