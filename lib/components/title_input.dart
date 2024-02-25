import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class titleInput extends StatelessWidget {
  const titleInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Title",
          style: TextStyle(
            color: Color(0xff5038BC),
            decoration: TextDecoration.none,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Color(0xff5038BC)),
            ),
            hintText: "Enter title (max 25 characters)",
          ),
          inputFormatters: [
            LengthLimitingTextInputFormatter(25),
          ],
        ),
      ],
    );
  }
}
