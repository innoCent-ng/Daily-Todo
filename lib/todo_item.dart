import 'package:flutter/material.dart';

import 'model.dart';

class ToDoitem extends StatelessWidget {
  final ToDo todo;

  // ignore: prefer_typing_uninitialized_variables
  final onToDoChanged;
  // ignore: prefer_typing_uninitialized_variables
  final onDeleteItem;

  const ToDoitem(
      {super.key, required this.todo, this.onToDoChanged, this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      color: Colors.transparent,
      child: ListTile(
        title: Text(
          todo.todoText!,
          style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 13,
              decoration: todo.isDone ? TextDecoration.lineThrough : null),
        ),
        tileColor:const  Color.fromARGB(255, 255, 255, 255),
        leading: Icon(
          todo.isDone
              ? Icons.check_box
              : Icons.check_box_outline_blank_outlined,
          color: const Color.fromARGB(255, 0, 119, 216),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        onTap: () {
          onToDoChanged(todo);
        },
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 7),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color.fromARGB(255, 223, 31, 17),
          ),
          child: Center(
            child: IconButton(
              onPressed: () {
                onDeleteItem(todo.id);
              },
              icon: const Icon(
                Icons.delete,
              ),
              color: Colors.white,
              iconSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
