import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

class Todo {
  //final String title;
  //final String description;

  //Todo(this.title, this.description);
  String name;
  String req1;

  //final String req2;
  //final String img;

  Todo(this.name, this.req1);

  Todo.fromJson(Map<String, dynamic> json){
  name = json['name'];
  req1 = json['req1'];
    }
}

  void main() {
    runApp(MaterialApp(
    title: 'Passing Data',
    home: TodosScreen(),
    ));
  }

  class TodosScreen extends StatelessWidget {
  // final List<Todo> jdata;

  //TodosScreen({Key key, @required this.jdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: Text('Todos'),
  ),
  body: Container(
  child : FutureBuilder(
  future:DefaultAssetBundle.of(context).loadString("assets/Technology.json"),
  builder:(BuildContext context, AsyncSnapshot snapshot){
  var jdata = json.decode(snapshot.data.toString());
  //jdata = json.decode(snapshot.data.toString());
  if(snapshot.data==null)
  {
    return Container(child:Center(child:Text("Loading..."),));
  } else{
    return ListView.builder(
      itemCount: jdata == null ? 0 : jdata.length,
      itemBuilder: (BuildContext context, int index){
      return GestureDetector(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget> [
      ListTile(
      title : Text(jdata[index]['name']),
      subtitle: Text(jdata[index]['req1']),
      onTap: () {
      Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => DetailScreen(todo: jdata[index]),),);
          },)],
          ),
          );
          },
      );
      }
    },),
  ),);
  }
}

  class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo.
  final Todo todo;

  // In the constructor, require a Todo.
  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  // Use the Todo to create the UI.
  return Scaffold(
  appBar: AppBar(
  title: Text(todo.name),
  ),
  body: Padding(
  padding: EdgeInsets.all(16.0),
  child: Text(todo.req1),
    ),
  );
  }
}