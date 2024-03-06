import 'package:flutter/material.dart';
import 'package:todoapp/components/back_button.dart';
import 'package:todoapp/components/description_input.dart';
import 'package:todoapp/components/title_input.dart';
import 'package:todoapp/models/task.dart';

class editTask extends StatefulWidget {
  editTask({super.key, required this.idx,required this.task,required this.editedTask});

  final int idx;
  final Task task;
  final Function (Task task) editedTask; 

  @override
  State<editTask> createState() => _editTaskState();
}

class _editTaskState extends State<editTask> {
  late TextEditingController _editTitleController;
  late TextEditingController _editDescriptionController;
  late double _currentProgress;
  late bool _newIsDone;
  
  @override
  void initState() {
    super.initState();
    _editTitleController = TextEditingController(text: widget.task.title);
    _editDescriptionController = TextEditingController(text: widget.task.description);
    _currentProgress = widget.task.progress.toDouble();
  }

  @override
  void dispose(){
    _editTitleController.dispose();
    _editDescriptionController.dispose();
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
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      backButton(),
                      Text(
                        "Edit Task",
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 30
                        ),
                      ),
                      // supaya text edit task ditengah
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
                      titleInput(controller: _editTitleController),
                      const SizedBox(height: 40,),
                      const Text("Category",
                        style: TextStyle(
                          color: Color(0xff5038BC),
                          decoration: TextDecoration.none,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xff5038BC),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: widget.task.isPriority? const Text(
                              "Priority Task",
                              style: TextStyle(
                                color:Colors.white,
                                fontSize: 14,
                              ),
                            ):const Text(
                              "Daily Task",
                              style: TextStyle(
                                color:Colors.white,
                                fontSize: 14,
                              ),
                          )
                        )
      
                      ),
                      
                      widget.task.isPriority? progressSection() : Container(),
      
                      const SizedBox(height: 40),
                      descriptionInput(controller: _editDescriptionController),
                      const SizedBox(height: 40,),
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          
                          onPressed: (){
                            if(_editTitleController.text.isEmpty){
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Please fill title field"),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                            else{
                              _newIsDone = _currentProgress == 100 ? true : false;
                              widget.editedTask(Task(
                                id: widget.task.id,
                                title: _editTitleController.text,
                                description: _editDescriptionController.text,
                                isPriority: widget.task.isPriority,
                                isDone: _newIsDone,
                                progress: _currentProgress,
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
                            "Edit Task",
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

  Column progressSection(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40,),
        const Text("Progress",
          style: TextStyle(
            color: Color(0xff5038BC),
            decoration: TextDecoration.none,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),
        Slider(
          value: _currentProgress,
          min: 0,
          max: 100,
          divisions: 100,
          label: _currentProgress.round().toString(),
          onChanged: (double value){
            setState(() {
              _currentProgress = value;
            });
          }
        ),
      ],
    );
  }
}