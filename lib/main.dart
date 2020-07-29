import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'Item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: Center(
          child: Hotel(),
        ),
      ),
    );
  }
}

class Hotel extends StatefulWidget {
  Hotel() : super();

  @override
  HotelState createState() => HotelState();
}

class HotelState extends State<Hotel> {
  //
  CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
    'https://www.thespruceeats.com/thmb/BNMKJiHueV_Eh9n246pdEZM1Ijw=/3626x2418/filters:no_upscale():max_bytes(150000):strip_icc()/bar101-cocktails-504754220-580e83415f9b58564cf470b9.jpg',
    'https://craftlog.com/m/i/3136910=s1280=h960.webp',
    'https://myfoodstory.com/wp-content/uploads/2018/09/The-Best-Chicken-Biryani-Recipe-3.jpg ',
    'https://d2vfuonq97e746.cloudfront.net/wp-content/uploads/2018/06/Chicken-Kurma_08-main.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CarouselSlider(
                items: imgList.map((imgUrl) {
                  return Builder(builder: (BuildContext context) {
                    return Container(
                      child: GestureDetector(onLongPress: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return Item();
                            }));
                      }),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(imgUrl),
                            fit: BoxFit.fill,
                          )),
                    );
                  });
                }).toList(),
                options: CarouselOptions(
                  height: 400.0,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  reverse: false,
                  enableInfiniteScroll: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 2000),
                  pauseAutoPlayOnTouch: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
