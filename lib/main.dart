import 'package:flutter/material.dart';
import 'package:flutter_application_test_swift_dynamic/calculator.dart';
import 'package:flutter_application_test_swift_dynamic/collect_personal_information/collect_personal_information.dart';
import 'package:flutter_application_test_swift_dynamic/stepper_form.dart';
import 'package:flutter_application_test_swift_dynamic/todo_list/to_do_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Sitanan Phubunkhong'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/aomam_sitanan.jpg"),
              minRadius: 50,
              maxRadius: 75,
            ),
            SizedBox(
              height: 90,
            ),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ToDolist()));
                  },
                  icon: Icon(Icons.list_outlined),
                  label: Text("To do list")),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Calculator()));
                  },
                  icon: Icon(Icons.calculate_outlined),
                  label: Text("เครื่องคิดเลข")),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CollectPersonalInformation()));
                  },
                  icon: Icon(Icons.person_add_alt),
                  label: Text("เก็บข้อมูลบุคคล")),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StepperForm()));
                  },
                  icon: Icon(Icons.featured_play_list_outlined),
                  label: Text("Stepper")),
            )
          ],
        ),
      ),
    );
  }
}
