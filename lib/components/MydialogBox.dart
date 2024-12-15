import 'package:flutter/material.dart';

class MyDialogBox extends StatelessWidget {
  final Function(String) onSave; // Callback to save the todo
  final TextEditingController controller = TextEditingController();

  MyDialogBox({super.key, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add Todo"),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: "Enter your todo item"),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            onSave(controller.text); // Pass the entered value back to HomePage
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text("Save"),
        ),
      ],
    );
  }
}
