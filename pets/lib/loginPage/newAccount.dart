import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewAccount extends StatefulWidget {

 

  @override
  _NewAccountState createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {

  final fs=Firestore.instance;
  void createUser(String username,String mail,String password)
  {
    fs.collection("users").add({
      "username": username,
      "mail": mail,
      "password": password
    });
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Neşeli Yürüyüşler"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: "Kullanıcı Adı",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: mailController,
                  decoration: InputDecoration(
                    hintText: "E-Posta",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "Şifre",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),

             
              SizedBox(height: 20),
              Row(
                children: [
                  InkWell(
                        onTap: (){createUser(usernameController.text, mailController.text, passwordController.text);},
                        child: Container(
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
                        )),
                  )
                ],
              )
            ],
          ),
        ));
  }
}

