import 'package:flutter/material.dart';

class backButton extends StatelessWidget {
  const backButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        height: 35,
        width: 35,
        child: Icon(Icons.arrow_back),
        decoration: BoxDecoration(
      
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
      ),
    );
  }
}