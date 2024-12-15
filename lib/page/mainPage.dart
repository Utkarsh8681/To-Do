// // import 'package:flutter/material.dart';
// // import 'package:to_doo/components/MydialogBox.dart';
// // import 'package:to_doo/components/searchBar.dart';
// // import 'package:to_doo/components/toDoTile.dart';

// // class HomePage extends StatefulWidget {
// //   const HomePage({super.key});

// //   @override
// //   State<HomePage> createState() => _HomePageState();
// // }

// // class _HomePageState extends State<HomePage> {
// //   List<String> ToDos = [];

// //   void addToDo(String todoo) {
// //     setState(() {
// //       ToDos.add(todoo);
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           showDialog(
// //               context: context,
// //               builder: (BuildContext context) {
// //                 return Mydialogbox(
// //                   save: addToDo,
// //                 );
// //               });
// //         },
// //         child: Icon(Icons.add),
// //       ),
// //       backgroundColor: Colors.grey[200],
// //       body: SafeArea(
// //         child: Column(
// //           children: [
// //             Padding(
// //               padding: const EdgeInsets.all(8.0),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   Icon(
// //                     Icons.menu,
// //                     size: 30,
// //                   ),
// //                   Padding(
// //                     padding: const EdgeInsets.all(12.0),
// //                     child: ClipOval(
// //                       child: Image.asset(
// //                         "assets/utkarsh_passport_photo.jpg",
// //                         height: 50,
// //                         width: 50,
// //                         fit: BoxFit.contain,
// //                       ),
// //                     ),
// //                   )
// //                 ],
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 20.0),
// //               child: Column(
// //                 // mainAxisAlignment: MainAxisAlignment.start,
// //                 // crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   const MySearchBar(),
// //                   SizedBox(
// //                     height: 20,
// //                   ),
// //                   Text(
// //                     "All ToDo's ",
// //                     style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
// //                   ),
// //                   SizedBox(
// //                     height: 10,
// //                   ),
// // Expanded(
// //   child: ListView.builder(
// //     itemCount: ToDos.length,
// //     itemBuilder: (context, index) {
// //       return Todotile(toDo: ToDos[index]);
// //     },
// //   ),
// // )
// //                   // Todotile(
// //                   //   toDo: "dinner Time",
// //                   // )
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:to_doo/components/toDoTile.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<String> todos = ["Hello", "bye"];

//   void addToDo(String todo) {
//     setState(() {
//       todos.add(todo);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.grey[200],
//         body: Expanded(
//           child: ListView.builder(
//             itemCount: todos.length,
//             itemBuilder: (context, index) {
//               return Todotile(toDo: todos[index]);
//             },
//           ),
//         ));
//   }
// }
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
      todos.add(
        todo,
      ); // Add new todo to the list
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
