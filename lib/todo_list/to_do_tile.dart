import 'package:flutter/material.dart';

class ToDoTile extends StatefulWidget {
  const ToDoTile({Key? key}) : super(key: key);

  @override
  _ToDoTileState createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: buildShowCheckbox(isChecked, (bool? value) {
        setState(() {
          isChecked = value;
        });
      }),
      title: Text(
        "go to shopping",
        style: TextStyle(
            decoration: isChecked! ? TextDecoration.lineThrough : null),
      ),
    );
  }
}

class buildShowCheckbox extends StatelessWidget {
  final bool? checkboxState;
  final Function(bool?) checkboxChange;
  buildShowCheckbox(this.checkboxState, this.checkboxChange);
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      onChanged: checkboxChange,
      value: checkboxState,
    );
  }
}
