import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SlidingPicturesPage extends StatelessWidget {
  final List<String> pictureUrls = [
    'https://example.com/picture1.jpg',
    'https://example.com/picture2.jpg',
    'https://example.com/picture3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliding Pictures'),
      ),
      body: CarouselSlider(
        options: CarouselOptions(
          height: 400,
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
        items: pictureUrls.map((url) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
