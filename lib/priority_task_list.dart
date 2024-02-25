import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todoapp/models/task.dart';

class priorityTaskList extends StatelessWidget {
  const priorityTaskList({super.key, required this.priorityItems, required this.onToggleCompletion, required this.onRemove, required this.onEdit});

  final List<Task> priorityItems;
  final Function(int index, bool isSelected) onToggleCompletion;
  final Function(int index) onRemove;
  final Function(int index) onEdit;

  @override
  Widget build(BuildContext context) {
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
                          onToggleCompletion(index,!priorityItems[index].isSelected);
                          Navigator.of(context).pop(); 
                        },
                      ),
                    ],
                  );
                },
              );
            },
            onLongPress: (){
              onEdit(index);
            },
            child: Dismissible(
              direction: DismissDirection.up,
              key : UniqueKey(),
              onDismissed: (direction){
                onRemove(index);
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
                  color:  priorityItems[index].isSelected ?Color(0xff5038BC) : Color(0xffa8bddd) , 
                  borderRadius: BorderRadius.circular(25),
                ),
                alignment: Alignment.center, 
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    priorityItems[index].title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
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
}