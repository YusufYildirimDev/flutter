import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  String userName;
  Chat(String newUserName) {
    this.userName = newUserName;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(userName),centerTitle: true,),
      body: chatBody(),
    );
  }
}

Widget chatBody(){
  return (
      Center(child: Text("Mesajlaşma"),)
  );
}