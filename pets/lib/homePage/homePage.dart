import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets/profilePage/profile.dart';
import 'package:pets/searchPanel/searchPage.dart';

import 'home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;
  List<Widget> _pageList;
  @override
  void initState() {
    super.initState();
    _pageList = [Home(), SearchPage(), ProfilePage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPage,
        selectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Ana Sayfa"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Ara"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt),
            title: Text("Profil"),
          ),
        ],
        onTap: (int selectedPosition) {
          setState(() {
            selectedPage = selectedPosition;
          });
        },
      ),
    );
  }
}
