import 'package:flutter/material.dart';

class addTask extends StatelessWidget {
  const addTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff5038BC),
      ),
      child: Column(
        children: [
          SizedBox(height: 40),
          Text(
            "Add Task",
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontSize: 30
            ),
          ),
          SizedBox(height: 40),
          Expanded(
            child: Container(
              color: Colors.white,

            ),
          ),
        ],
      
      ),
    );
  }
}