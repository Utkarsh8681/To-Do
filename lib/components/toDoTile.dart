import 'package:flutter/material.dart';

class ToDoTile extends StatefulWidget {
  const ToDoTile(
      {super.key,
      required this.todo,
      required this.taskCompleted,
      this.onChanged});

  final String todo;
  final bool taskCompleted;
  final Function(bool?)? onChanged;

  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  final List<String> items = [
    'Aman',
    'Utkarsh',
    'Abhishek',
    'Vedant',
    'Aanand'
  ];

  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: ListTile(
            leading: Checkbox(
              value: widget.taskCompleted,
              onChanged: widget.onChanged,
            ),
            title: Text(
              widget.todo,
              style: TextStyle(
                  decoration: widget.taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            trailing: DropdownButton<String>(
              value: selectedItem,
              hint: Text("Select a Namme"),
              icon: Icon(Icons.arrow_drop_down),
              items: items.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedItem = newValue;
                });
              },
            ),
          )),
    );
  }
}
