import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets/messageBox/messageBox.dart';
import 'package:pets/notifications/notifications.dart';
import 'package:pets/postCard/postCard.dart';
import 'package:pets/models/photos_model.dart';
import 'package:pets/services/photos_services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
   Future<List<Photos>> futureData;

  @override
  void initState() {
    super.initState();
    futureData=fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Neşeli Yürüyüşler"),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => MessageBox()));
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.send),
            ),
          ),
        ],
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => Notifications()));}, icon: Icon(Icons.notifications)),
        ),
      body: FutureBuilder <List<Photos>>(
        future: futureData,
        builder: (BuildContext context,snapshot){
          if(snapshot.hasData){
            List<Photos> data = snapshot.data;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index){
                return PostCard(data[index].url.toString());
               // print(data[index].url.toString());
              }
              );
          }
          return Center(child: CircularProgressIndicator(),);
        }
        )
    );
  }
}
