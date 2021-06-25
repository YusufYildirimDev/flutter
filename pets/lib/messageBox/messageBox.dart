import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets/messageBox/chat.dart';

class MessageBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mesajlar"),
        centerTitle: true,
      ),
      body: messageBody(context),
    );
  }
}

Widget messageBody(BuildContext context) {
  return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
      child: ListView(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Ara",
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
          ),
          SizedBox(height: 50),
          showMessage(
              "https://cdn.pixabay.com/photo/2016/11/21/14/53/man-1845814_960_720.jpg",
              "selam Ceren nasılsın",
              "Ahmet Taş",
              context),
          showMessage(
              "https://cdn.pixabay.com/photo/2015/09/02/12/39/woman-918583_960_720.jpg",
              "iyi geceler <3",
              "Buse Kartal",
              context),
          showMessage(
              "https://cdn.pixabay.com/photo/2016/11/22/21/42/woman-1850703_960_720.jpg",
              "tamamdır hallediyorum",
              "Gizem Nur",
              context),
        ],
      ));
}

Widget showMessage(
    String imageLink, String message, String userName, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 8),
    child: InkWell(
      onTap: () {
        Navigator.push(
            context, CupertinoPageRoute(builder: (context) => Chat(userName)));
      },
      child: Stack(
        children: [
          Container(
              height: 50, decoration: BoxDecoration(color: Colors.grey[300])),
          Positioned(
              top: 5,
              left: 10,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.white),
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(imageLink), fit: BoxFit.cover),
                ),
              )),
          Positioned(
            top: 5,
            left: 60,
            child: Column(
              children: [
                Text(
                  userName,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  message,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
