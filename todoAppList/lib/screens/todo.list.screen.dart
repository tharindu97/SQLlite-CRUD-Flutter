import 'package:flutter/material.dart';
import 'package:todoAppList/screens/add.task.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {

  Widget buildTask(int index){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          ListTile(
            title: Text('task title'),
            subtitle: Text('Oct 2, 2019 * High'),
            trailing: Checkbox(
              value: true, 
              onChanged: (value){
                print(value);
              },
              activeColor: Theme.of(context).primaryColor,
            ),
          ),
          Divider()
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_) => AddTask())),
      ),

      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 80),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index){
          if(index == 0){
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Task',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text(
                    '1 of 10',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600
                    ),  
                  )
                ],
              ),
            );
          }
          return buildTask(index);
        }
      ),
    );
  }
}