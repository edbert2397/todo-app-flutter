import 'package:flutter/material.dart';

class addTask extends StatefulWidget {
  const addTask({super.key});

  @override
  State<addTask> createState() => _addTaskState();
}

class _addTaskState extends State<addTask> {

  final TextEditingController _titleController = TextEditingController();

  @override
  void dispose(){
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            SizedBox(height: 50),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(left:30,top: 50,bottom: 50,right:30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Title",
                      style: TextStyle(
                        color: Color(0xff5038BC),
                        decoration: TextDecoration.none,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      
                      controller: _titleController,
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
                    )
                    
                  ],
                ),
      
              ),
            ),
          ],
        
        ),
      ),
    );
  }
}