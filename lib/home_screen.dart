import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/add_task_screen.dart';
import 'package:todoapp/bottom_navbar.dart';
import 'package:todoapp/edit_task_screen.dart';
import 'package:todoapp/models/task.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  static const String routeName = '/';

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  late List<Task> items;
  late List<Task> priorityItems;
  late List<Task> dailyItems;
  late List<bool> isSelectedPriorityItems;
  late List<bool> isSelectedDailyItems;
  late List<bool> isSelected;

  @override
  void initState() {
    super.initState();
    items = [];
    priorityItems = [];
    dailyItems = [];
    isSelected = List.generate(items.length,(_) => false);
    isSelectedPriorityItems = List.generate(priorityItems.length,(_) => false);
    isSelectedDailyItems = List.generate(dailyItems.length,(_) => false);
  }
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),  
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              timeDisplay(),
              SizedBox(height: 15),
              Text("Welcome Edbert.H",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
        
                ),
              ),
              Text("Have a nice day !",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xff5038BC)),
                      minimumSize: MaterialStateProperty.all<Size>(Size(120, 55)),
                    ),
                    onPressed: () {
                      Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => addTask(addedTask: (newTask){
                          setState(() {
                            items.add(newTask);
                            isSelected.add(false);
                            if(newTask.isPriority == true){
                              priorityItems.add(newTask);
                              isSelectedPriorityItems.add(false);
                            }
                            else{
                              dailyItems.add(newTask);
                              isSelectedDailyItems.add(false);
                  
                            }
                          });
                        },)
                        )
                      );
                    },
                    child: const Text('Add Task',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                        
                      ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text("My Priority Task",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6,),
              priorityItems.isNotEmpty
              ? SizedBox(
                  height: 150, 
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: priorityItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          // setState((){
                          //   isSelectedPriorityItems[index] = !isSelectedPriorityItems[index];
                          // });
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(priorityItems[index].title), 
                                content: Text(priorityItems[index].description), 
                                actions:[
                                  TextButton(
                                    child: Text("Close"),
                                    onPressed: () {
                                      Navigator.of(context).pop(); 
                                    },
                                  ),
                                  TextButton(
                                    child: isSelectedPriorityItems[index] == true? Text("Mark as not Done") : Text("Mark as Done"),
                                    onPressed: () {
                                      setState(() {
                                        isSelectedPriorityItems[index] == true? isSelectedPriorityItems[index] = false: isSelectedPriorityItems[index] = true; 
                                        Navigator.of(context).pop(); 
                                      });
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        onLongPress: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => editTask(idx: index,task: priorityItems[index],editedTask: (newEdittedtask){
                              setState(() {
                                priorityItems[index] = newEdittedtask;
                                isSelectedPriorityItems[index] = false;
                              });
                            })),
                          );
                        },
                        child: Dismissible(
                          direction: DismissDirection.up,
                          key : UniqueKey(),
                          onDismissed: (direction){
                            setState(() {
                              // items.removeAt(index);
                              // isSelected.removeAt(index);

                              priorityItems.removeAt(index);
                              isSelectedPriorityItems.removeAt(index);
                            });
                          },
                          background: Container(
                            padding: EdgeInsets.symmetric(horizontal:20),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            
                            child: Center(child: Icon(FontAwesomeIcons.trash)),
                          ),
                          child: Container(
                            width: 120, 
                            margin: EdgeInsets.symmetric(horizontal: 10), 
                            decoration: BoxDecoration(
                              color:  isSelectedPriorityItems[index] ?Color(0xff5038BC) : Color(0xff5038BC).withOpacity(0.6) , 
                              borderRadius: BorderRadius.circular(25),
                            ),
                            alignment: Alignment.center, 
                            child: Text(
                              priorityItems[index].title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                              ),
                               
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Container(), 

              SizedBox(height: 20,),
              
              Text("My Daily Task",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: dailyItems.length,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        // setState(() {
                        //   // isSelected[index] = !isSelected[index];
                        //   isSelectedDailyItems[index] = !isSelectedDailyItems[index];
                        // });
                         showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(dailyItems[index].title), 
                              content: Text(dailyItems[index].description), 
                              actions: [
                                TextButton(
                                  child: Text("Close"),
                                  onPressed: () {
                                    Navigator.of(context).pop(); 
                                  },
                                ),
                                TextButton(
                                  child: isSelectedDailyItems[index] == true ? Text("Mark as not Done") : Text("Mark as Done"),
                                  onPressed: () {
                                    setState(() {
                                      isSelectedDailyItems[index] == true? isSelectedDailyItems[index] = false : isSelectedDailyItems[index] = true; 
                                      Navigator.of(context).pop(); 
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      onLongPress: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => editTask(idx: index,task: dailyItems[index],editedTask: (newEdittedtask){
                            setState(() {
                              dailyItems[index] = newEdittedtask;
                              isSelectedDailyItems[index] = false;
                            });
                          })),
                        );
                      },
                      child: Dismissible(
                        direction: DismissDirection.endToStart,
                        key : UniqueKey(),
                        onDismissed: (direction){
                          setState(() {
                            // items.removeAt(index);
                            // isSelected.removeAt(index);

                            dailyItems.removeAt(index);
                            isSelectedDailyItems.removeAt(index);
                          });
                        },
                        background: Container(
                          padding: EdgeInsets.symmetric(horizontal:20),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          
                          child: 
                          Row(
                            children: [
                              Spacer(),
                              Icon(FontAwesomeIcons.trash),
                            ],
                          ),
                        ),
                        
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 6),
                          padding: EdgeInsets.symmetric(horizontal:20,vertical: 15),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(dailyItems[index].title,
                                style:TextStyle(
                                  color: isSelectedDailyItems[index]? Color(0xff5038BC) : Colors.black
                        
                        
                                ),
                              ),
                        
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color(0xff5038BC),
                                    width: 2,
                                  
                                  ),
                                  color: isSelectedDailyItems[index]? Color(0xff5038BC) : Colors.transparent
                                ),
                              )
                            ],
                          )
                        
                        ),
                      ),
                    );
                  }
                
                ),
              )
            ],
          ),
      ),
        bottomNavigationBar: bottomNavbar(),
    );
  }
}

class timeDisplay extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, MMM d yyyy').format(now);
    return Text(
      formattedDate,
      style: TextStyle(
        fontSize: 20,
      ),
      
    );
  }
}