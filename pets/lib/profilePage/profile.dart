import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets/about/about.dart';
import 'package:pets/profilePage/liked.dart';
import 'package:pets/profilePage/profileSettings.dart';
import 'package:pets/profilePage/saved.dart';
import 'package:pets/profilePage/usage.dart';





class ProfilePage extends StatelessWidget {
  static BuildContext thisContext;
  @override
  Widget build(BuildContext context) {
    thisContext=context;
    return Scaffold(
      appBar: AppBar(
        title: Text("Neşeli Yürüyüşler"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton<String>(
           onSelected:choiceAction,
            itemBuilder: (BuildContext context)=><PopupMenuEntry<String>>[
            const PopupMenuItem(
              value: "Settings",
              child: Text("Profil Ayarları"),),
              const PopupMenuItem(
              value: "Liked",
              child: Text("Beğendiklerim"),),
             const PopupMenuItem(
              value: "About",
              child: Text("Hakkımızda"),),
              const PopupMenuItem(
              value: "Saved",
              child: Text("Kaydedilenler"),),
              const PopupMenuItem(
              value: "Usage",
              child: Text("Günlük Kullanım"),),
          ] 
          )
        ],
        ),
      body: profilePageBody(),
    );
  }

  void choiceAction(String choice)
  {
    if(choice=="About")
    {
      Navigator.push(ProfilePage.thisContext,
                    CupertinoPageRoute(builder: (context) => About()));
    }
    if(choice=="Settings")
    {
      Navigator.push(ProfilePage.thisContext,
                    CupertinoPageRoute(builder: (context) => ProfileSettings()));
    }
    if(choice=="Saved")
    {
      Navigator.push(ProfilePage.thisContext,
                    CupertinoPageRoute(builder: (context) => Saved()));
    }
    if(choice=="Liked")
    {
      Navigator.push(ProfilePage.thisContext,
                    CupertinoPageRoute(builder: (context) => Liked()));
    }
    if(choice=="Usage")
    {
      Navigator.push(ProfilePage.thisContext,
                    CupertinoPageRoute(builder: (context) => Usage()));
    }
  }

}



Widget profilePageBody()
{
  return ListView(
      children: [
        Stack(
          children: [
            Container(
              height: 230.0,
            ),
            Container(
              height: 180.0,
              decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2015/10/12/15/01/cat-984097_960_720.jpg"),
                      fit: BoxFit.cover)),
            ),
            Positioned(
                left: 20.0,
                bottom: 0.0,
                child: Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(60.0),
                      border: Border.all(width: 2.0, color: Colors.white),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://cdn.pixabay.com/photo/2017/04/05/10/45/girl-2204622_960_720.jpg"),
                          fit: BoxFit.cover)),
                )),
            Positioned(
                top: 190.0,
                left: 145.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ceren Kaya",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "theCeren",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    )
                  ],
                ))
          ],
        )
      ],
    );
}


