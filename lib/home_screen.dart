import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/add_task_screen.dart';
import 'package:todoapp/bottom_navbar.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  List<String> items = [
    'Work Out',
    'Daily Meeting',
    'Reading a Book',
    'Daily Meeting',
    'Assignment Revision',
    "fadff",
    "faaf",
    "123",
    "2234",
    "4ef"
  ];
  late List<bool> isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = List.generate(items.length,(_) => false);
  }
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 50),  
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              timeDisplay(),
              SizedBox(height: 30),
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
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Text("Daily Task",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xff5038BC)),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => addTask()));
                    },
                    child: const Text('Add Task',
                            style: TextStyle(
                              color: Colors.white,
                            ),
          
                      ),
                  ),
                ]
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          isSelected[index] = !isSelected[index];
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal:20,vertical: 15),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(items[index],
                              style:TextStyle(
                                color: isSelected[index]? Color(0xff5038BC) : Colors.black


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
                                color: isSelected[index]? Color(0xff5038BC) : Colors.transparent
                              ),
                            )
                          ],
                        )
                      
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