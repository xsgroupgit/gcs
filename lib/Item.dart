import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class item extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return itemState();
  }
}

class itemState extends  State<item> {
  @override
  Widget build(BuildContext context) {
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
              carouselSlider = CarouselSlider(
                height: 300.0,
                initialPage: 0,
                enlargeCenterPage: true,
                autoPlay: true,
                reverse: false,
                enableInfiniteScroll: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 2000),
                pauseAutoPlayOnTouch: Duration(seconds: 3),
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  setState(() {
                    _current = index;
                  });
                },
                items: imgList.map((imgUrl) {
                  return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              color: Colors.green,
                            ),
                            child: Image.network(
                              imgUrl,
                              fit: BoxFit.fill,
                            ),

                        );
                      });
                }).toList(),
              ),


            ],
          ),

        ),
      ),
      );
    }
  }
}
