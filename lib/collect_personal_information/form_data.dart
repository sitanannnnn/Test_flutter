import 'package:flutter/material.dart';

class FormData extends StatefulWidget {
  const FormData({Key? key}) : super(key: key);

  @override
  State<FormData> createState() => _FormDataState();
}

class _FormDataState extends State<FormData> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("แบบฟอร์มบันทึกข้อมูล"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            child: Column(key: _formKey, children: [
              FormName(),
              SizedBox(
                height: 10,
              ),
              FormNickname(),
              SizedBox(
                height: 10,
              ),
              FormAge(),
              SizedBox(
                height: 10,
              ),
              FormPhonenumber(),
              SizedBox(
                height: 10,
              ),
              FormEmail(),
              SizedBox(
                height: 10,
              ),
              SaveButton()
            ]),
          ),
        ));
  }

  Widget SaveButton() {
    return Container(
        width: 375,
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Save")));
  }

  //form input email
  Widget FormEmail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Email",
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  //form input phonenumber
  Widget FormPhonenumber() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Phonenumber",
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.phone,
    );
  }

  //form input age
  Widget FormAge() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Age",
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
    );
  }

  //form input nickname
  Widget FormNickname() {
    return TextFormField(
        decoration: InputDecoration(
          labelText: "Nickname",
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.name);
  }

  //form input name
  Widget FormName() {
    return TextFormField(
        decoration: InputDecoration(
          labelText: "Name",
          border: OutlineInputBorder(),
        ),
        autofocus: true,
        keyboardType: TextInputType.name);
  }
}
