import 'package:flutter/material.dart';

class NewAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Neşeli Yürüyüşler"),
        centerTitle: true,
      ),
      body: newAccount(),
    );
  }
}

Widget newAccount() {
  return Padding(
    padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
    child: ListView(
      children: [
        newInput("Ad Soyad"),
        newInput("E-posta"),
        newInput("Şifre"),
        newInput("Şifre Tekrar"),
        SizedBox(height: 20),
        Row(
          children: [
            Container(
                width: 120,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    "Kaydol",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ))
          ],
        )
      ],
    ),
  );
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
