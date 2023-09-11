import 'package:daily/todo_item.dart';
import 'package:flutter/material.dart';
import 'model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todolist();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 153, 152, 152),
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    onChanged: (value) => _runFilter(value),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 20,
                        ),
                        prefixIconConstraints: BoxConstraints(
                          maxHeight: 20,
                          maxWidth: 25,
                        ),
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: Colors.black,
                        )),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        child: const Text(
                          'Daily Tasks',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      for (ToDo todoo in _foundToDo.reversed)
                        ToDoitem(
                          todo: todoo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteItem,
                        )
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                          bottom: 20, right: 20, left: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 221, 220, 223),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(255, 2, 2, 2),
                              offset: Offset(0.0, 0.0),
                              spreadRadius: 0.0,
                              blurRadius: 10.0)
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _todoController,
                        decoration: const InputDecoration(
                          hintText: 'Add new Item',
                          hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20, right: 20),
                    child: FloatingActionButton(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      backgroundColor: const Color.fromARGB(255, 48, 54, 63),
                      onPressed: () {
                        _addTodoItem(_todoController.text);
                      },
                      child: const Center(
                        child: Text(
                          '+',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addTodoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo));
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color.fromARGB(255, 209, 206, 206),
      title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Icon(
              Icons.menu,
              color: Color(0xFF222020),
              size: 30,
            ),
            Container(
              color: Colors.transparent,
              width: 40,
              height: 40,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(40)),
                child: Image.asset('images/ic.jpg'),
              ),
            ),
          ]),
    );
  }
}
