import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pets/postCard/postCard.dart';

class Saved extends StatefulWidget {

  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  List<String> posts=[];
  void getLink() async
  {
   var snapshot= await Firestore.instance.collection("saved").getDocuments();
   snapshot.documents.forEach((element) { 
     setState(() {
       posts.add(element.data["link"]);
     });
   });
  }

  @override
  void initState() {
    super.initState();
    getLink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kaydedilenler"),centerTitle: true),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index){
          return PostCard(posts[index]);
        }
        ),
    );
  }
}

