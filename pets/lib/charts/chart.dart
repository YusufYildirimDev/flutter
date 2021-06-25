import 'package:flutter/material.dart';

class Chart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Günlük Kullanımlar"),centerTitle: true,),
      body: Text("Grafikler"),
    );
  }
}