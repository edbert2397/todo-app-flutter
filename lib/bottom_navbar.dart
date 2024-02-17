import 'package:flutter/material.dart';
import 'package:todoapp/home_screen.dart';
import 'package:todoapp/profile.dart';

class bottomNavbar extends StatelessWidget {
  const bottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: Color(0xff5038BC),
              size: 40,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const homeScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: Color(0xff5038BC),
              size:40,
            ),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile()),
              );
            },
          ),
        ],
      ),
    );
  }
}