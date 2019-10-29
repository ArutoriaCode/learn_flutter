import 'package:flutter/material.dart';


const CITY_NAMES = ['北京', '上海', '广州', '深圳', '洛阳', '西安', '天津', '拉萨'];

class LearnOnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _buildList(),
      ),
    );
  }
}

List<Widget> _buildList() {
  return CITY_NAMES.map((city) => _item(city)).toList();
}

Widget _item(String city) {
  return Container(
    width: 160,
    margin: EdgeInsets.only(right: 5),
    alignment: Alignment.center,
    decoration: BoxDecoration(color: Colors.teal),
    child: Text(
      city,
      style: TextStyle(color: Colors.white, fontSize: 20),
    ),
  );
}