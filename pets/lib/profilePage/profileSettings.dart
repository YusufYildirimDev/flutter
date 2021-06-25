import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets/charts/chart.dart';
import 'package:pets/profilePage/updateProfile.dart';

class ProfileSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profil Ayarları"),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Center(
        child: Column(
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => Chart()));
              },
                          child: Container(
                width: 200,
                height: 50,
                child: Center(child: Text("Kullanımlarım",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),),
                decoration: BoxDecoration(color: Colors.grey[400],borderRadius: BorderRadius.circular(30)),
              ),
            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: (){
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => UpdateProfile()));
              },
                          child: Container(
                width: 200,
                height: 50,
                child: Center(child: Text("Profili Güncelle",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),),
                decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(30)),
              ),
            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: (){},
                          child: Container(
                width: 200,
                height: 50,
                child: Center(child: Text("Çıkış Yap",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),),
                decoration: BoxDecoration(color: Colors.red[400],borderRadius: BorderRadius.circular(30)),
              ),
            )
          ],
        ),),
      ),
    );
  }
}