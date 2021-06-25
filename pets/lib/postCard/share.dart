import 'package:flutter/material.dart';

class Share extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Paylaş"),centerTitle: true,),
      body: ListView(
        children: [
          FlatButton.icon(onPressed: (){}, icon: Icon(Icons.save), label: Text("Galariye Kaydet")),
          FlatButton.icon(onPressed: (){}, icon: Icon(Icons.message), label: Text("SMS İle Yolla")),
          FlatButton.icon(onPressed: (){}, icon: Icon(Icons.link), label: Text("Link Olarak Kopyala")),
          FlatButton.icon(onPressed: (){}, icon: Icon(Icons.facebook), label: Text("Facebook'da Paylaş")),
        ]
      ),
    );
  }
}