import 'package:flutter/material.dart';

class categoryButton extends StatelessWidget {
  const categoryButton({super.key, required this.index, required this.text, required this.selectedIndex, required this.onSelected});

  final int index;
  final String text;
  final int selectedIndex;
  final Function(int) onSelected;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50,
      child: ElevatedButton(
        
        onPressed: () => onSelected(index),
        child: Text(
          text,
          style: TextStyle(
            color: selectedIndex == index?Colors.white : Color(0xff5038BC),
          ),
        ),
        style: ElevatedButton.styleFrom(
      
          backgroundColor: selectedIndex == index? Color(0xff5038BC): Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
      
          )
        )
      ),
    );
  }
}