// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:courses/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "COURSES",
                      style: TextStyle(
                        color: Color(0xFF023F71),
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(Icons.more_vert, size: 35),
                      onPressed: () {
                        print("More Vert Pressed");
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          handleBottomNavigationIconPressed(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.folder_open,
              color: primaryColor,
            ),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              color: primaryColor,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.format_align_left_rounded,
              color: primaryColor,
            ),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.feedback_outlined,
              color: primaryColor,
            ),
            label: 'Feedback',
          ),
        ],
      ),
    );
  }

  void handleBottomNavigationIconPressed(int index) {
    // Add your logic for each bottom navigation icon press here
    print('Bottom navigation icon at index $index is pressed');
  }
}
