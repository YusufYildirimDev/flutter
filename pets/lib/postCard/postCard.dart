import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets/postCard/comments.dart';
import 'package:pets/postCard/report.dart';
import 'package:pets/postCard/share.dart';

class PostCard extends StatefulWidget {
  String imageLink;
  PostCard(this.imageLink);
  @override
  _PostCardState createState() => _PostCardState(imageLink);
}

class _PostCardState extends State<PostCard> {
  final fs=Firestore.instance;
  String imageLink;
  _PostCardState(this.imageLink);
  double _width=0;
  double _height=0;
  Color _color=Colors.grey[600];
  bool isLiked=false;
  double liked()
  {
    fs.collection("liked").add({
      "link": imageLink,
    });
    setState(() {
      if(isLiked==false)
      {
        _width=100;
        _height=100;
        _color=Colors.red[900];
        isLiked=true;
        Future.delayed(Duration(seconds: 1),(){
        setState(() {
          _width=0;
          _height=0;
             });
        });
      }
      else{
        setState(() {
          _color=Colors.grey[600];
          isLiked=false;
        });
      }
    });
  }

  
  
  void savePost()
  {
    fs.collection("saved").add({
      "link": imageLink,
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onDoubleTap: (){liked();},
        onLongPress: (){
          showDialog(
            context: context, 
            builder: (BuildContext context)=>AlertDialog(
              //insetPadding: EdgeInsets.symmetric(vertical: 270),
                actions: [
                  Column(
                    children: [
                      TextButton(onPressed: (){
                        savePost();
                        Navigator.pop(context);}, child: Text("Kaydet")),
                      TextButton(onPressed: (){Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => Report()));}, child: Text("Şikayet Et")),
                    ],
                  )
                ],
              )
            );
          },
        child: Padding(
        padding: const EdgeInsets.all(20.0),
        child:Stack(
          alignment: AlignmentDirectional.center,
          children: [
              Container(
          width: 350,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(color: Colors.grey, offset: Offset(1, 2), blurRadius: 2.0)
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 220.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.indigo,
                      image: DecorationImage(
                          image: NetworkImage(imageLink),
                          fit: BoxFit.cover)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(onPressed: (){liked();}, icon: Icon(Icons.favorite,color: _color,), label: Text("Beğen", style: TextStyle(color: Colors.grey[600]))),
                  FlatButton.icon(onPressed: (){Navigator.push(context, CupertinoPageRoute(builder: (context) => Comments()));}, icon: Icon(Icons.comment, color: Colors.grey[600]), label: Text("Yorum Yap", style: TextStyle(color: Colors.grey[600]))),
                  
                  FlatButton.icon(onPressed: (){Navigator.push(context, CupertinoPageRoute(builder: (context) => Share()));}, icon: Icon(Icons.share, color: Colors.grey[600],), label: Text("Paylaş", style: TextStyle(color: Colors.grey[600])))
                  
                ],
              )
            ],
          ),
        ),
        AnimatedContainer(
                duration: Duration(milliseconds: 900),
                curve: Curves.bounceOut,
                width: _width,
                height: _height,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/heart.png"),fit: BoxFit.cover)),
              )
          ],
        )

          
      ),
    );
  }
  Widget flatButtons(Icon icon, String text,BuildContext context) {
  return FlatButton.icon(
      onPressed: () {
        if(text=="Beğen")
          liked();
        },
      icon: icon,
      label: Text(text, style: TextStyle(color: Colors.grey[600])));
}
}

