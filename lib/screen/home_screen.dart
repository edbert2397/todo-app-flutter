import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/screen/add_task_screen.dart';
import 'package:todoapp/screen/edit_task_screen.dart';
import 'package:todoapp/bottom_navbar.dart';
import 'package:todoapp/models/task.dart';
import 'dart:convert';

import 'package:todoapp/storage_service.dart';




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
  final StorageService _storageService = StorageService(); 


  @override
  void initState() {
    priorityItems = [];
    dailyItems = [];

    super.initState();
    _storageService.loadPriorityItems().then((loadedItems) {
      setState(() {
        priorityItems = loadedItems;
      });
    });
    _storageService.loadDailyItems().then((loadedItems) {
      setState(() {
        dailyItems = loadedItems;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.purple.shade100,
          ),
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  
                buildTopBar(),
                const SizedBox(height: 15),
                buildWelcomeText(),
                const SizedBox(height: 20,),
                priorityItemsList(),
                const SizedBox(height: 15,),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(topLeft: const Radius.circular(40),topRight: Radius.circular(40)),
                      color: Colors.grey.shade100,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        dailyTaskList(),
                        const SizedBox(height: 25,),
                        buildAddTaskSection(),              
                      ]
                  
                    )
                    
                  ),
                )
          
              ],
            ),
        ),
      ),
      bottomNavigationBar: const bottomNavbar(),
    );
  }

  Padding buildTopBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 30,right: 30,top: 30),
      child: Row(
        children: [
          timeDisplay(),
          const Spacer(),
          const Icon(Icons.notifications,color: Color(0xff5038BC),)
        ],
      ),
    );
  }
  Padding buildWelcomeText(){
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal:30.0),
      child: Column(
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
      ),
    );
  }
  Padding priorityItemsList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("My Priority Task",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
          const SizedBox(height: 6,),
            SizedBox(
              height: 150, 
              child: priorityItems.isNotEmpty ? 
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: priorityItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(priorityItems[index].title),
                                  Text(
                                    "${priorityItems[index].progress.round()}% done",
                                    style: const TextStyle( 
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ), 
                              content: Text(priorityItems[index].description), 
                              actions:[
                                TextButton(
                                  child: const Text("Close"),
                                  onPressed: () {
                                    Navigator.of(context).pop(); 
                                  },
                                ),
                                TextButton(
                                  child: priorityItems[index].isDone == true? const Text("Mark as not Done") : const Text("Mark as Done"),
                                  onPressed: () {
                                    setState(() {
                                      bool now = priorityItems[index].isDone;
                                      now == true? priorityItems[index].isDone = false: priorityItems[index].isDone = true;
                                      now == true? priorityItems[index].progress = 0 : priorityItems[index].progress = 100;

                                      _storageService.savePriorityItems(priorityItems); 
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
                              _storageService.savePriorityItems(priorityItems);
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
                            _storageService.savePriorityItems(priorityItems);
                          });
                        },
                        background: Container(
                          padding: const EdgeInsets.symmetric(horizontal:20),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          
                          child: const Center(child: Icon(FontAwesomeIcons.trash)),
                        ),
                        child: Container(
                          width: 120, 
                          margin: const EdgeInsets.symmetric(horizontal: 10), 
                          decoration: BoxDecoration(
                            color:  priorityItems[index].isDone ?const Color(0xff5038BC) : const Color(0xff907cc4) , 
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          priorityItems[index].title,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:10.0,right: 10.0,bottom:10.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 6,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: LinearProgressIndicator(
                                          backgroundColor: Colors.white,
                                          valueColor: AlwaysStoppedAnimation<Color>(Colors.purple.shade700),
                                          value: priorityItems[index].progress/100,
                                        ),
                                      ),
                                    ),
                                  )
                                  
                                ],
                              ),
                            ),
                          ),
                        ),
                    );
                  },
                ) :
                const Text(
                  "No Priority Task",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
            )
        ],
      ),
    );
  }

  Expanded dailyTaskList() {
    return Expanded(
      child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("My Daily Task",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6,),
            dailyItems.isNotEmpty ? Expanded(
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
                                child: const Text("Close"),
                                onPressed: () {
                                  Navigator.of(context).pop(); 
                                },
                              ),
                              TextButton(
                                child: dailyItems[index].isDone == true ? const Text("Mark as not Done") : const Text("Mark as Done"),
                                onPressed: () {
                                  setState(() {
                                    dailyItems[index].isDone == true? dailyItems[index].isDone = false : dailyItems[index].isDone = true; 
                                    _storageService.saveDailyItems(dailyItems);
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
                            _storageService.saveDailyItems(dailyItems);
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
                          _storageService.saveDailyItems(dailyItems);
                        });
                      },
                      background: Container(
                        padding: const EdgeInsets.symmetric(horizontal:20),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        
                        child: 
                        const Row(
                          children: [
                            Spacer(),
                            Icon(FontAwesomeIcons.trash),
                          ],
                        ),
                      ),
                      
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.symmetric(horizontal:20,vertical: 15),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(dailyItems[index].title,
                              style:TextStyle(
                                color: dailyItems[index].isDone? const Color(0xff5038BC) : Colors.black,
                                decoration: dailyItems[index].isDone? TextDecoration.lineThrough : null,
                                
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xff5038BC),
                                  width: 2,
                                
                                ),
                                color: dailyItems[index].isDone? const Color(0xff5038BC) : Colors.transparent
                              ),
                            )
                          ],
                        )
                      
                      ),
                    ),
                  );
                }
              
              ),
            ):
            const Text(
              "No Daily Task",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            )
          ],
        )
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
                  _storageService.savePriorityItems(priorityItems); 
                }
                else{
                  dailyItems.add(newTask);
                  _storageService.saveDailyItems(dailyItems); 
      
                }
              });
            },))
          );
        },
        style: ElevatedButton.styleFrom(
      
          backgroundColor:const Color(0xff5038BC),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
      
          )
        ), 
        child: const Text(
          "Add Task",
          style: TextStyle(
            color: Colors.white ,
          ),
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
      style: const TextStyle(
        fontSize: 20,
      ),
      
    );
  }
}