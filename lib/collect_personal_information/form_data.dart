import 'package:flutter/material.dart';
import 'package:flutter_application_test_swift_dynamic/model/informatiom.dart';
import 'package:flutter_application_test_swift_dynamic/provider/information_provider.dart';
import 'package:provider/provider.dart';

class FormData extends StatefulWidget {
  const FormData({Key? key}) : super(key: key);

  @override
  State<FormData> createState() => _FormDataState();
}

class _FormDataState extends State<FormData> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final nicknameController = TextEditingController();
  final ageController = TextEditingController();
  final phonenumberController = TextEditingController();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("แบบฟอร์มบันทึกข้อมูล"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(children: [
                //input name
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                  autofocus: true,
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return "Please input name";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                //input nickname
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Nickname",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                  controller: nicknameController,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return "Please input nickname";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                //input age
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Age",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  controller: ageController,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return "Please input age";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                //input phonenumber
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Phonenumber",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  controller: phonenumberController,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return "Please input phonenumber";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                //input email
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return "Please input email";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                //save button
                Container(
                    width: 375,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            var name = nameController.text;
                            var nickname = nicknameController.text;
                            var age = ageController.text;
                            var phonenumber = phonenumberController.text;
                            var email = emailController.text;
                            print("name==>$name");
                            print("nickname==>$nickname");
                            print("age==>$age");
                            print("phonenumber==>$phonenumber");
                            print("email==>$email");
                            //เตรียมข้อมูล
                            Informations personal = Informations(
                                name: name,
                                nickname: nickname,
                                age: int.parse(age),
                                phonenumber: phonenumber,
                                email: email,
                                date: DateTime.now()); //object
                            //เรียก Provider
                            var provider = Provider.of<InformationProvider>(
                                context,
                                listen: false);
                            provider.addInformation(personal);
                            Navigator.pop(context);
                          }
                        },
                        child: Text("Save")))
              ]),
            ),
          ),
        ));
  }
}
