class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todolist() {
    return [
      ToDo(
        id: '01',
        todoText: 'Never GiveUp',
      ),
      ToDo(
        id: '02',
        todoText: 'I Cannot Fail',
      ),
      ToDo(
        id: '03',
        todoText: 'Watch Cartoona',
      ),
      ToDo(
        id: '04',
        todoText: 'Watch movies',
      ),
      ToDo(
        id: '05',
        todoText: 'Cook Delicious Food',
      ),
      ToDo(
        id: '06',
        todoText: 'Debug Debug',
      ),
      ToDo(
        id: '07',
        todoText: 'Develop Websites',
      ),
      ToDo(
        id: '08',
        todoText: 'Study and medidate on the word of God',
      )
    ];
  }
}
