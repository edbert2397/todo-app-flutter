import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), 
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(
              Icons.home,
              color: Color(0xff5038BC),
              size: 40,
            ),
            onPressed: () {
              if (ModalRoute.of(context)?.settings.name != homeScreen.routeName) {
                Navigator.pop(context);
              }
            },
          ),
          IconButton(
            icon: const Icon(
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