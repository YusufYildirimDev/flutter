import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  String title="Şikayet Et";
  void changeState(String text){
    setState(() {
      title="Şikayet Et : "+text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Şikayet Et"),centerTitle: true,),
      body: ListView(
          children: [
            TextButton(onPressed: (){changeState("Uygunsuz İçerik");}, child: Text("Uygunsuz İçerik")),
            TextButton(onPressed: (){changeState("Uygunsuz Kullanıcı Adı");}, child: Text("Uygunsuz Kullanıcı Adı")),
            TextButton(onPressed: (){changeState("Uygulama Dışı Kullanım");}, child: Text("Uygulama Dışı Kullanım")),
            FlatButton(onPressed: (){Navigator.pop(context);}, child: Text(title,style: TextStyle(color: Colors.white),),color: Colors.red,)
          ],
      )
      
    );
  }
}