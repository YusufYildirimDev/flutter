import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 200,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(color: Colors.grey, offset: Offset(1, 2), blurRadius: 2.0)
          ],
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 220.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.indigo,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2017/02/15/12/12/cat-2068462_960_720.jpg"),
                        fit: BoxFit.cover)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                flatButtons(
                    Icon(Icons.favorite, color: Colors.grey[600]), "Beğen"),
                flatButtons(
                    Icon(Icons.comment, color: Colors.grey[600]), "Yorum Yap"),
                flatButtons(
                    Icon(Icons.share, color: Colors.grey[600]), "Paylaş"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget flatButtons(Icon icon, String text) {
  return FlatButton.icon(
      onPressed: () {},
      icon: icon,
      label: Text(text, style: TextStyle(color: Colors.grey[600])));
}