import 'package:flutter/material.dart';
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
                    ),
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
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: ElevatedButton(
                            
                            onPressed: (){
                              setState(() {
                                _selectedIndex = 0;
                              });
                            }, 
                            child: Text(
                              "Priority Task",
                              style: TextStyle(
                                color: _selectedIndex == 0?Colors.white : Color(0xff5038BC),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                          
                              backgroundColor: _selectedIndex == 0? Color(0xff5038BC): Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                          
                              )
                            )
                          ),
                        ),
                        SizedBox(width: 20,),
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: ElevatedButton(
                          
                            onPressed: (){
                              setState(() {
                                _selectedIndex = 1;
                              });
                            }, 
                            child: Text(
                              "Daily Task",
                              style: TextStyle(
                                color: _selectedIndex == 1?Colors.white : Color(0xff5038BC),
                              ),                          
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _selectedIndex == 1? Color(0xff5038BC): Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                          
                              )
                            )
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 50),
                    Text("Description",
                      style: TextStyle(
                        color: Color(0xff5038BC),
                        decoration: TextDecoration.none,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      
                      controller: _descriptionController,
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
                    SizedBox(height: 40,),
                    SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            
                            onPressed: (){
                              if(_titleController.text.isEmpty || _descriptionController.text.isEmpty ){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all the fields")));
                              }
                              else{
                                widget.addedTask(Task(
                                  title: _titleController.text,
                                  description: _descriptionController.text,
                                  isSelected: _selectedIndex == 0 ? true : false,
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