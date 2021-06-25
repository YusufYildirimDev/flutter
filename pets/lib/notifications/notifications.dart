import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bildirimler"),centerTitle: true,),
      body: ListView(
        children: [
          TextButton(onPressed: (){}, child: Text("1. Bildirim")),
          TextButton(onPressed: (){}, child: Text("2. Bildirim")),
          TextButton(onPressed: (){}, child: Text("3. Bildirim")),
          TextButton(onPressed: (){}, child: Text("4. Bildirim")),
        ],
      ),
    );
  }
}