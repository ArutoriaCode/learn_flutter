import 'package:flutter/material.dart';

class LearnThreePage extends StatefulWidget {
  @override
  _LearnThreePageState createState() => _LearnThreePageState();
}

class _LearnThreePageState extends State<LearnThreePage> {
  ScrollController _scrollController = ScrollController();
  List<String> cityName = ['北京', '上海', '广州', '深圳', '洛阳', '西安', '天津', '拉萨'];
  bool ace = false;
  Color bgColor = Colors.blue;
  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadData();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RefreshIndicator(
        onRefresh: handleRefresh,
        child: ListView(
          controller: _scrollController,
          children: _buildList(),
        ),
      ),
    );
  }

  _loadData() async {
    await Future.delayed(Duration(milliseconds: 200));
    setState(() {
      cityName = cityName.reversed.toList();
    });
  }

  List<Widget> _buildList() {
    return cityName.map((v) => _item(v)).toList();
  }

  Widget _item(String name) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: bgColor),
      child: Text(name, style: TextStyle(fontSize: 20)),
    );
  }

  Future<Null> handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
    setState(() {
      List<String> list = List<String>.from(cityName);
      list.addAll(cityName);
      cityName = list;
      ace = !ace;
      bgColor = ace ? Colors.red : Colors.blue;
    });
    return null;
  }
}
