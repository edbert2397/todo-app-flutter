import 'package:flutter/material.dart';

class editTask extends StatefulWidget {
  editTask({super.key, required this.idx});

  final int idx;
  @override
  State<editTask> createState() => _editTaskState();
}

class _editTaskState extends State<editTask> {
  final TextEditingController _editTitleController = TextEditingController();
  final TextEditingController _editDescriptionController = TextEditingController();
  
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
      body: Container(
          decoration: BoxDecoration(
            color: Color(0xff5038BC),
          ),
          child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                "Edit Task",
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
                        
                        controller: _editTitleController,
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

                      Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xff5038BC),
                          borderRadius: BorderRadius.circular(10)
                          
                        ),
                        child: Center(
                          child: Text(
                            "Daily Task",
                            style: TextStyle(
                              color:Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        )

                      ),

                      // SizedBox(
                      //   width: double.infinity,
                      //   height: 50,

                      //   child: Text(
                      //     "Daily Task",
                      //     style: TextStyle(
                      //       color:Colors.white,
                      //     ),
                      //   )
                      // ),

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
                        
                        controller: _editDescriptionController,
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
                              
                              onPressed: (){}, 
                              child: Text(
                                "Edit Task",
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