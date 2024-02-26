import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/add_task_screen.dart';
import 'package:todoapp/bottom_navbar.dart';
import 'package:todoapp/edit_task_screen.dart';
import 'package:todoapp/models/task.dart';
import 'dart:convert';

import 'package:todoapp/priority_task_list.dart';


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

  @override
  void initState() {
    priorityItems = [];
    dailyItems = [];

    super.initState();
    loadPriorityItems().then((loadedItems) {
      setState(() {
        priorityItems = loadedItems;
      });
    });
    loadDailyItems().then((loadedItems) {
      setState(() {
        dailyItems = loadedItems;
      });
    });
  }

  Future<void> savePriorityItems(List<Task> items) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> stringList = items.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList('priorityItems', stringList);
  }

  Future<List<Task>> loadPriorityItems() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> stringList = prefs.getStringList('priorityItems') ?? [];
    List<Task> items = stringList.map((itemStr) => Task.fromJson(jsonDecode(itemStr))).toList();
    return items;
  }
  Future<void> saveDailyItems(List<Task> items) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> stringList = items.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList('dailyItems', stringList);
  }

  Future<List<Task>> loadDailyItems() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> stringList = prefs.getStringList('dailyItems') ?? [];
    List<Task> items = stringList.map((itemStr) => Task.fromJson(jsonDecode(itemStr))).toList();
    return items;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),  
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              buildTopBar(),
              SizedBox(height: 15),
              buildWelcomeText(),
              SizedBox(height: 20,),
              Text("My Priority Task",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6,),
              priorityItems.isNotEmpty ? priorityItemsList() : Container(),

              SizedBox(height: 20,),
              Text("My Daily Task",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              dailyTaskList(),
              SizedBox(height: 25,),
              buildAddTaskSection(),              

            ],
          ),
      ),
        bottomNavigationBar: bottomNavbar(),
    );
  }

  Row buildTopBar() {
    return Row(
      children: [
        timeDisplay(),
        Spacer(),
        Icon(Icons.notifications,color: Color(0xff5038BC),)
      ],
    );
  }
  Column buildWelcomeText(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ],
    );
  }
  SizedBox priorityItemsList() {
    return SizedBox(
      height: 150, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: priorityItems.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
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
                        child: priorityItems[index].isSelected == true? Text("Mark as not Done") : Text("Mark as Done"),
                        onPressed: () {
                          setState(() {
                            priorityItems[index].isSelected == true? priorityItems[index].isSelected = false: priorityItems[index].isSelected = true;
                            savePriorityItems(priorityItems); 
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
                    savePriorityItems(priorityItems);
                  });
                })),
              );
            },
            child: Dismissible(
              direction: DismissDirection.up,
              key : UniqueKey(),
              onDismissed: (direction){
                setState(() {
                  priorityItems.removeAt(index);
                  savePriorityItems(priorityItems);
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
                  color:  priorityItems[index].isSelected ?Color(0xff5038BC) : Color(0xffa8bcdd) , 
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      priorityItems[index].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Expanded dailyTaskList() {
    return Expanded(
      child: ListView.builder(
        itemCount: dailyItems.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
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
                        child: dailyItems[index].isSelected == true ? Text("Mark as not Done") : Text("Mark as Done"),
                        onPressed: () {
                          setState(() {
                            dailyItems[index].isSelected == true? dailyItems[index].isSelected = false : dailyItems[index].isSelected = true; 
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
                    saveDailyItems(dailyItems);
                  });
                })),
              );
            },
            child: Dismissible(
              direction: DismissDirection.endToStart,
              key : UniqueKey(),
              onDismissed: (direction){
                setState(() {
                  dailyItems.removeAt(index);
                  saveDailyItems(dailyItems);
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
                        color: dailyItems[index].isSelected? Color(0xff5038BC) : Colors.black,
                        decoration: dailyItems[index].isSelected? TextDecoration.lineThrough : null,
                        
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
                        color: dailyItems[index].isSelected? Color(0xff5038BC) : Colors.transparent
                      ),
                    )
                  ],
                )
              
              ),
            ),
          );
        }
      
      ),
    );
  }
  SizedBox buildAddTaskSection(){
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        
        onPressed: (){
          Navigator.push(context, 
            MaterialPageRoute(builder: (context) => addTask(addedTask: (newTask){
              setState(() {
                if(newTask.isPriority == true){
                  priorityItems.add(newTask);
                  savePriorityItems(priorityItems); 
                }
                else{
                  dailyItems.add(newTask);
                  saveDailyItems(dailyItems); 
      
                }
              });
            },))
          );
        }, 
        child: Text(
          "Add Task",
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