import 'package:flutter/material.dart';

import 'beranda.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final String nama = "tif1a", sandi = "politeknikkampar";
  final namaController = TextEditingController();
  final sandiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //yang ini untuk nama
          TextFormField(
            controller: namaController,
            decoration: InputDecoration(hintText: 'Masukkan Nama Pengguna'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Mohon Masukkan Data Terlebih Dahulu';
              }
              return null;
            },
          ),
          //Yang ini untuk sandi
          TextFormField(
            controller: sandiController,
            obscureText: true,
            decoration: InputDecoration(hintText: "Masukkan Sandi"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Mohon Masukkan Data Terlebih Dahulu';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (namaController.text.trim() == nama &&
                    sandiController.text.trim() == sandi) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                } else {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content:
                        Text('Maaf Nama Pengguna Atau Sandi Tidak Tersedia'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  ));
                }
              },
              child: Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}
