import 'package:flutter/material.dart';

class LearnFourPage extends StatelessWidget {
  List<String> cityName = [
    '北京',
    '上海',
    '广州',
    '深圳',
    '洛阳',
    '西安',
    '天津',
    '拉萨',
    '北京',
    '上海',
    '广州',
    '深圳',
    '洛阳',
    '西安',
    '天津',
    '拉萨'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 4,
        children: _buildList(),
      ),
    );
  }

  List<Widget> _buildList() {
    return cityName.map((v) => _item(v)).toList();
  }

  Widget _item(String name) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(name, style: TextStyle(fontSize: 20)),
    );
  }
}
