import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final forKey = GlobalKey<FormState>();
  String title;
  String priority;
  DateTime date = DateTime.now();

  TextEditingController dateController = TextEditingController();
  final DateFormat dateFormat = DateFormat('MMM dd, yyyy');
  final List<String> priorities = ['Low', 'Medium', 'High'];

  @override
  void initState() { 
    super.initState();
    dateController.text = dateFormat.format(date);
  }

  @override
  void dispose() { 
    dateController.dispose();
    super.dispose();
  }

  handleDatePicker() async {
    final DateTime datePicker = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (datePicker != null && datePicker != date) {
      setState(() {
        date = datePicker;
      });
      dateController.text = dateFormat.format(datePicker);
    }
  }

  submit() {
    if(forKey.currentState.validate()){
      forKey.currentState.save();
      print('$title $date $priority');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Add Task',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Form(
                    key: forKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: TextFormField(
                            style: TextStyle(fontSize: 18.0),
                            decoration: InputDecoration(
                                labelStyle: TextStyle(fontSize: 18.0),
                                labelText: 'Title',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                            validator: (input) => input.trim().isEmpty
                                ? 'Please Enter the task'
                                : null,
                            onSaved: (input) => title = input,
                            initialValue: title,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: TextFormField(
                            controller: dateController,
                            onTap: handleDatePicker,
                            style: TextStyle(fontSize: 18.0),
                            decoration: InputDecoration(
                                labelStyle: TextStyle(fontSize: 18.0),
                                labelText: 'Date',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: DropdownButtonFormField(
                            isDense: true,
                            icon: Icon(Icons.arrow_drop_down_circle),
                            iconSize: 22.0,
                            iconEnabledColor: Theme.of(context).primaryColor,
                            items: priorities.map((String priority) {
                              return DropdownMenuItem(
                                  value: priority,
                                  child: Text(
                                    priority,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18.0),
                                  ));
                            }).toList(),
                            style: TextStyle(fontSize: 18.0),
                            decoration: InputDecoration(
                                labelStyle: TextStyle(fontSize: 18.0),
                                labelText: 'Priority',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                            validator: (input) => priority == null
                                ? 'Please select a priority level'
                                : null,
                            onSaved: (input) => priority = input,
                            onChanged: (value) {
                              setState(() {
                                priority = value;
                              });
                            },
                            value: priority,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 20.0),
                            height: 60.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(30.0)),
                            child: FlatButton(
                              onPressed: submit,
                              child: Text(
                                'Add',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ))
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
