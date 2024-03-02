import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoapp/components/back_button.dart';
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

  @override
  void dispose(){
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xff5038BC),
          ),
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal:30.0),
                child: Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    backButton(),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Add Task",
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontSize: 30
                          ),
                        ),
                      ),
                    ),
                    // supaya add text add task ada ditengah 
                    SizedBox(
                      height: 30,
                      width: 30,
                    )
                
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left:30,top: 50,bottom: 50,right:30),
                decoration: const BoxDecoration(
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
                    const SizedBox(height: 40,),
                    const Text("Category",
                      style: TextStyle(
                        color: Color(0xff5038BC),
                        decoration: TextDecoration.none,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
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
                        const SizedBox(width: 20,),
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
                    const SizedBox(height: 50),
                    descriptionInput(controller: _descriptionController),
                    const SizedBox(height: 40,),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        
                        onPressed: (){
                          if(_titleController.text.isEmpty ){
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please fill title Field")));
                          }
                          else{
                            widget.addedTask(Task(
                              title: _titleController.text,
                              description: _descriptionController.text,
                              isPriority: _selectedIndex == 0 ? true : false,
                              isDone: false,
                              progress: 0,
                            ));
                            Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                      
                          backgroundColor:const Color(0xff5038BC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                      
                          )
                        ), 
                        child: const Text(
                          "Create Task",
                          style: TextStyle(
                            color: Colors.white ,
                          ),
                        )
                      ),
                    ),
  
        
                      
                  ],
                ),
        
              ),
            ],
          
          ),
        ),
      ),
    );
  }
}