import 'package:flutter/material.dart';

class ToDoTile extends StatefulWidget {
  ToDoTile(
      {super.key,
      required this.todo,
      required this.taskCompleted,
      this.onChanged,
      required this.delete,
      required this.edit});

  final VoidCallback edit;
  final String todo;
  final VoidCallback delete;
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

  String? selectedItem = "Aman";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.grey[800]),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 9.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: widget.taskCompleted,
                        onChanged: widget.onChanged,
                      ),
                      Text(
                        widget.todo,
                        style: TextStyle(
                            fontSize: 20,
                            // color: Colors.white,
                            decoration: widget.taskCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            decorationColor: Colors.black,
                            decorationThickness: 3),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: widget.edit,
                          icon: Icon(
                            Icons.edit,
                            // color: Colors.white,
                          )),
                      IconButton(
                          onPressed: widget.delete,
                          icon: Icon(
                            Icons.delete,
                            //  color: Colors.white
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        //  ListTile(
        //   leading: Checkbox(
        //     value: widget.taskCompleted,
        //     onChanged: widget.onChanged,
        //   ),
        //   title:
        // Text(
        //     widget.todo,
        //     style: TextStyle(
        //         decoration: widget.taskCompleted
        //             ? TextDecoration.lineThrough
        //             : TextDecoration.none),
        //   ),
        //   trailing: DropdownButton<String>(
        //     value: selectedItem,
        //     hint: Text("Select a Name"),
        //     icon: Icon(Icons.arrow_drop_down),
        //     items: items.map((item) {
        //       return DropdownMenuItem<String>(
        //         value: item,
        //         child: Text(item),
        //       );
        //     }).toList(),
        //     onChanged: (String? newValue) {
        //       setState(() {
        //         selectedItem = newValue;
        //       });
        //     },
        //   ),
        // )
      ),
    );
  }
}
