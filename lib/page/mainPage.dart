import 'package:flutter/material.dart';
import 'package:to_doo/components/MydialogBox.dart';
import 'package:to_doo/components/toDoTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todos = [
    ['learn ', false],
    ["learn task", false],
    ["learn task", false],
  ]; // List to store todo items

  void addTodo(String todo) {
    setState(() {
      todos.add([todo, false]); // Add new todo to the list
    });
  }

  void checkboxChanged(int index) {
    setState(() {
      todos[index][1] = !todos[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return MyDialogBox(
                onSave: addTodo, // Pass the callback to handle saving
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            // Your existing UI components (e.g., search bar, header)
            Text(
              "All ToDo's",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (BuildContext context, index) {
                  return ToDoTile(
                    todo: todos[index][0],
                    onChanged: (value) => checkboxChanged(index),
                    taskCompleted: todos[index][1],
                  ); // Display each todo
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
