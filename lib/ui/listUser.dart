import 'package:flutter/material.dart';
import 'package:app_sem13_drift/database/database.dart';
import 'package:provider/provider.dart';

class listUser extends StatefulWidget {
  const listUser ({super.key});

  @override
  _listUserState createState() => _listUserState();
}

class _listUserState extends State<listUser> {
  late AppDatabase database;
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de usuarios'),
      ),
      body: FutureBuilder(
        future: database.getListUsers(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            List<User>? userList = snapshot.data;
            return ListView.builder(
              itemCount: userList!.length,
              itemBuilder: (context, index){
                User userData = userList[index];
                return ListTile(
                  title: Text(userData.name),
                  subtitle: Text(userData.email),
                );
              },
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          addUser();
        },
        child: Icon(Icons.add),
      )
    );
  }

  void addUser() async{
    var res = await Navigator.push(
      context, MaterialPageRoute(builder: (context)=>newUser())
    );
    if(res!=null){
      setState(() {

      });
    }
  }
}
