import 'package:flutter/material.dart';

class LearnTwoPage extends StatefulWidget {
  @override
  _LearnTwoPageState createState() => _LearnTwoPageState();
}

const CITY_NAMES = {
  '北京': ['东城区', '西城区'],
  '上海': ['黄浦区'],
  '广州': ['天河区', '黄浦区', '白云区'],
  '深圳': ['南山区', '福田区', '龙华区', '龙岗区'],
};

class _LearnTwoPageState extends State<LearnTwoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: buildList(),
      ),
    );
  }

  List<Widget> buildList() {
    List<Widget> widgets = [];
    CITY_NAMES.keys.forEach((key) {
      widgets.add(_item(key, CITY_NAMES[key]));
    });
    return widgets;
  }

  Widget _item(String city, List<String> subCities) {
    return ExpansionTile(
      title: Text(city, style: TextStyle(color: Colors.black54, fontSize: 20)),
      children: subCities.map((subCity) => _buildSub(subCity)).toList(),
    );
  }

  Widget _buildSub(String subCity) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: 30,
        margin: EdgeInsets.only(bottom: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.lightBlueAccent),
        child: Text(subCity),
      ),
    );
  }
}
