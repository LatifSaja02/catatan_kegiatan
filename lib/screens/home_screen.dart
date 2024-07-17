import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '/pages/list_kegiatan_page.dart';
import '/pages/about_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

  final List<Widget> _pageOptions;

  _HomeScreenState()
      : _pageOptions = [
          ListKegiatanPage(kegiatanList: []),
          AboutPage(),
        ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_pageIndex],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.amber,
        buttonBackgroundColor: Colors.amberAccent,
        backgroundColor: Colors.transparent,
        height: 60,
        index: _pageIndex,
        items: <Widget>[
          // Icon(Icons.home, color: Colors.white, size: 30),
          Icon(Icons.list, color: Colors.white, size: 30),
          Icon(Icons.account_circle, color: Colors.white, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
    );
  }
}
