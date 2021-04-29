import 'package:flutter/material.dart';
import 'package:pets/postCard/postCard.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PostCard(),
        PostCard(),
        PostCard(),
        PostCard(),
      ],
    );
  }
}
