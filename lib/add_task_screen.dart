import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoapp/components/category_button.dart';
import 'package:todoapp/components/description_input.dart';
import 'package:todoapp/components/title_input.dart';
import 'package:todoapp/models/task.dart';

class addTask extends StatefulWidget {
  const addTask({super.key, required this.addedTask});
  final Function(Task task) addedTask;
  @override
  State<addTask> createState() => _addTaskState();
}

class _addTaskState extends State<addTask> {
  int _selectedIndex = 0;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  List <bool> isSelected = [true,false];
  @override
  void dispose(){
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff5038BC),
        ),
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
              children: [
                Text(
                  "Add Task",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 30
                  ),
                ),
              ],
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
                    titleInput(controller: _titleController),
                    SizedBox(height: 40,),
                    Text("Category",
                      style: TextStyle(
                        color: Color(0xff5038BC),
                        decoration: TextDecoration.none,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        categoryButton(
                          index: 0, 
                          text: "Priority Task", 
                          selectedIndex: _selectedIndex, 
                          onSelected: (index){
                            setState(() {
                              _selectedIndex = index;
                            });
                          } 
                        ),
                        SizedBox(width: 20,),
                        categoryButton(
                          index: 1, 
                          text: "Daily Task", 
                          selectedIndex: _selectedIndex, 
                          onSelected: (index){
                            setState(() {
                              _selectedIndex = index;
                            });
                          }
                        )
                      ],
                    ),
                    SizedBox(height: 50),
                    descriptionInput(controller: _descriptionController),
                    SizedBox(height: 40,),
                    SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            
                            onPressed: (){
                              if(_titleController.text.isEmpty ){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill title Field")));
                              }
                              else{
                                widget.addedTask(Task(
                                  title: _titleController.text,
                                  description: _descriptionController.text == null ? "" : _descriptionController.text,
                                  isPriority: _selectedIndex == 0 ? true : false,
                                  isSelected: false,
                                ));
                                Navigator.pop(context);
                              }
                            }, 
                            child: Text(
                              "Create Task",
                              style: TextStyle(
                                color: Colors.white ,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                          
                              backgroundColor:Color(0xff5038BC),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                          
                              )
                            )
                          ),
                        ),


                    
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