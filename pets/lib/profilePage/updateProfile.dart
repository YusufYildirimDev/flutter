import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets/homePage/homePage.dart';

class UpdateProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profili Güncelle"),centerTitle: true,),
      body: Center(
        child: Padding(padding: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            newInput("Kullanıcı Adı"),
            newInput("Şifre"),
            newInput("E-Posta"),
            SizedBox(height: 40),
            InkWell(
              onTap: (){
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => HomePage()));
              },
              child: Container(
                width: 200,
                height: 50,
                child: Center(child: Text("Güncelle",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),),
                decoration: BoxDecoration(color: Colors.blue[400],borderRadius: BorderRadius.circular(30)),
              ),
            )
          ],
        ),
        ),
      ),
    );
  }
}

Widget newInput(String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      decoration: InputDecoration(
        hintText: text,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    ),
  );
}