import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class descriptionInput extends StatelessWidget {
  const descriptionInput({super.key, required this.controller});

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Description",
          style: TextStyle(
            color: Color(0xff5038BC),
            decoration: TextDecoration.none,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 10),
        TextField(
          
          controller: controller,
          maxLines: 5,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal:20,vertical: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.grey)
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Color(0xff5038BC))
            ),
          ),
        ),
      ],
    );
  }
}