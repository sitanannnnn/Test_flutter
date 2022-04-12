import 'package:flutter/material.dart';
import 'package:flutter_application_test_swift_dynamic/collect_personal_information/form_data.dart';
import 'package:flutter_application_test_swift_dynamic/model/informatiom.dart';
import 'package:flutter_application_test_swift_dynamic/provider/information_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
      body: Consumer(
        builder: (context, InformationProvider provider, child) {
          var count = provider.informations.length; //นับจำนวนข้อมูล
          if (count <= 0) {
            return Center(
              child: Text(
                "ไม่พบข้อมูล",
                style: TextStyle(fontSize: 30),
              ),
            );
          } else {
            return ListView.builder(
                itemCount: count,
                itemBuilder: (context, index) {
                  Informations data = provider.informations[index];
                  return Card(
                    color: Colors.purple.shade100,
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name : ${data.name.toString()}'),
                          Text('Nickname : ${data.nickname.toString()}'),
                          Text('Age : ${data.age.toString()}'),
                          Text("Phonenumber : ${data.phonenumber.toString()}"),
                          Text('Email : ${data.email.toString()}'),
                        ],
                      ),
                    ),
                  );
                });
          }
        },
      ),
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
