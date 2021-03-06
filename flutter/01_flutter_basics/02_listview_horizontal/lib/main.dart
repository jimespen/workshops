import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Horizontal List'),
          ),
          body: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 200.0,
                color: Colors.amber,
                child: ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Phone'),
                ),
              ),
              Container(
                width: 200.0,
                color: Colors.cyan,
                child: ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Phone'),
                ),
              ),
              Container(
                width: 200.0,
                color: Colors.amber,
                child: ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Phone'),
                ),
              ),
            ],
          ),
        ),
      );
}
