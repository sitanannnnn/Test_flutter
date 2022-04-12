import 'package:flutter/material.dart';
import 'package:flutter_application_test_swift_dynamic/collect_personal_information/form_data.dart';

class CollectPersonalInformation extends StatefulWidget {
  const CollectPersonalInformation({Key? key}) : super(key: key);

  @override
  State<CollectPersonalInformation> createState() =>
      _CollectPersonalInformationState();
}

class _CollectPersonalInformationState
    extends State<CollectPersonalInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("เก็บข้อมูลบุคคล"),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.purple.shade100,
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("name"),
                    Text("nickname"),
                    Text("age"),
                    Text("phonenumber"),
                    Text("email"),
                    Text("date"),
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FormData()));
        },
        backgroundColor: Colors.red.shade300,
        child: const Icon(Icons.add),
      ),
    );
  }
}
