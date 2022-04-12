import 'package:flutter/material.dart';
import 'package:flutter_application_test_swift_dynamic/todo_list/to_do_tile.dart';

class ToDolist extends StatefulWidget {
  const ToDolist({Key? key}) : super(key: key);
  @override
  State<ToDolist> createState() => _ToDolistState();
}

class _ToDolistState extends State<ToDolist> {
  final List<String> todoLists = [];
  final TextEditingController _textFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('To do list'),
      ),
      body: ListView(children: [
        Column(
          children: showToDoList(),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // dialog input to do list
          buildDialodInputList(context);
        },
        backgroundColor: Colors.pink[400],
        child: const Icon(Icons.add),
      ),
    );
  }

//เเสดงค่าshowToDoList โดย_buildTodoList คือข้อมูลที่นำมาเเสดง
  List<Widget> showToDoList() {
    final List<Widget> _todoWidgets = <Widget>[];
    for (String title in todoLists) {
      _todoWidgets.add(_buildTodoList(title));
    }
    return _todoWidgets;
  }

  //  list of todolist
  Widget _buildTodoList(String title) {
    return ListTile(title: Text(title));
  }

  // dialog input to do list
  Future<dynamic> buildDialodInputList(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add to do list'),
            content: Form(
              key: _formKey,
              child: TextFormField(
                controller: _textFieldController,
                decoration:
                    const InputDecoration(hintText: 'Enter to do list here'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter to do list';
                  }
                  return null;
                },
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('ADD'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    //print("to do list==>${_textFieldController.text}");
                    setState(() {
                      todoLists.add(_textFieldController.text);
                      print("to do list==>$todoLists");
                    });

                    Navigator.of(context).pop();
                  }
                  _textFieldController.clear();
                },
              ),
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
