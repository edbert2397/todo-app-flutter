import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/bottom_navbar.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body: SingleChildScrollView(
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
                  onPressed: () {},
                  child: const Text('Add Task',
                          style: TextStyle(
                            color: Colors.white,
                          ),
  
                    ),
                ),
              ]
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