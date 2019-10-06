import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imageUrls = [
    'https://i.loli.net/2019/09/23/UmX1JvozjHT6ptG.jpg',
    'https://i.loli.net/2019/09/23/arTdwsouyOE6jJl.png',
    'https://i.loli.net/2019/09/23/Tb4Ywi2eMPrH3zQ.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: NotificationListener(
              onNotification: (scroll) {
                if (scroll is ScrollUpdateNotification && scroll.depth == 0) {
                  _onScroll(scroll.metrics.pixels);
                }
              },
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 280,
                    decoration: BoxDecoration(color: Colors.black38),
                    child: Swiper(
                      itemCount: _imageUrls.length,
                      autoplay: true,
                      autoplayDelay: 5000, // 间隔5秒
                      itemBuilder: (BuildContext context, int index) {
                        return FadeInImage.memoryNetwork(
                          image: _imageUrls[index],
                          placeholder: kTransparentImage,
                          fit: BoxFit.fill,
                        );
                      },
                      pagination: SwiperPagination(),
                    ),
                  ),
                  Container(
                    height: 300,
                    child: ListTile(
                      title: Text('内容'),
                    ),
                  )
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 0,
          )
        ],
      ),
    );
  }

  void _onScroll(double pixels) {
    print(pixels);
  }
}
