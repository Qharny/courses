import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Your Content Goes Here',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            height: screenWidth * 0.155,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 30,
                  offset: Offset(0, 10),
                ),
              ],
              borderRadius: BorderRadius.circular(50),
            ),
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.024),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                    HapticFeedback.lightImpact();
                  });
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Stack(
                  children: [
                    SizedBox(
                      width: screenWidth * 0.2125,
                      child: Center(
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          height:
                              index == currentIndex ? screenWidth * 0.12 : 0,
                          width:
                              index == currentIndex ? screenWidth * 0.2125 : 0,
                          decoration: BoxDecoration(
                            color: index == currentIndex
                                ? const Color(0xFF0C4EC1).withOpacity(0.2)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.2125,
                      alignment: Alignment.center,
                      child: Icon(
                        listOfIcons[index],
                        size: screenWidth * 0.076,
                        color: index == currentIndex
                            ? Colors.blueAccent
                            : Colors.black26,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.folder_rounded,
    Icons.favorite_rounded,
    Icons.format_align_left_outlined,
    Icons.feedback_outlined,
  ];
}
