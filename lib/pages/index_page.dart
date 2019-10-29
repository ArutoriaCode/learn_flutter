import 'package:flutter/material.dart';
import 'package:learn_flutter/pages/learn_one_page.dart';
import 'package:learn_flutter/pages/learn_three.dart';
// import 'package:learn_flutter/pages/learn_two_page.dart';
import 'package:learn_flutter/pages/learn_four_page.dart';

class IndePage extends StatefulWidget {
  @override
  _IndePageState createState() => _IndePageState();
}

class _IndePageState extends State<IndePage> {
  
  List<Widget> _currentPage = [
    LearnOnePage(),
    // LearnTwoPage(),
    LearnFourPage(),
    LearnThreePage()
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('learn Flutter'),
      ),
      body: _currentPage[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('分类')),
          BottomNavigationBarItem(icon: Icon(Icons.my_location), title: Text('我的'))
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
           _currentIndex = index;
          });
        },
      ),
    );
  }
}
