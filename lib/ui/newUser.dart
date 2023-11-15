import 'package:flutter/material.dart';
import 'package:app_sem13_drift/database/database.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as dr;

class newUser extends StatefulWidget {
  const newUser({super.key});

  @override
  _newUserState createState() => _newUserState();
}

class _newUserState extends State<newUser> {
  late AppDatabase appDatabase;
  late TextEditingController txtName;
  late TextEditingController txtEmail;

  @override
  void initState() {
    super.initState();
    txtName = TextEditingController();
    txtEmail = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    appDatabase = Provider.of<AppDatabase>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Nuevo usuario'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: txtName,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              hintText: 'Ingrese nombre'
            ),
          ),
      SizedBox(height: 30,),
          TextFormField(
            controller: txtEmail,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              hintText: 'Ingrese email'
            ),
          ),
      SizedBox(height: 30,),
          ElevatedButton(
            onPressed: (){
              appDatabase.insertUser(
                UsersCompanion(
                  name: dr.Value(txtName.text),
                  email: dr.Value(txtEmail.text)
                )
              );
            },
            child: Text('Guardar'),
          )
        ],
        ]
      ),
    );
  }

}



