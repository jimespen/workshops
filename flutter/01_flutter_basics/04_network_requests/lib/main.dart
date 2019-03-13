import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Joke generator!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  Future<Text> fetchJoke() async {
    final response = await http.get('https://icanhazdadjoke.com/',
        headers: {'Accept': 'application/json'});

    if (response.statusCode == 200) {
      return Text(json.decode(response.body)['joke']);
    } else {
      return Text('Failed to load joke');
    }
  }

  FutureBuilder<Widget> jokeBuilder(futureJoke) {
    return FutureBuilder<Widget>(
      future: futureJoke,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data;
        } else if (snapshot.hasError) {
          return Text("Found error ${snapshot.error}");
        }

        return CircularProgressIndicator();
      },
    );
  }

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget joke = Text('');

  void _generateJoke() {
    setState(() {
      joke = widget.jokeBuilder(widget.fetchJoke());
    });
  }

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
            Text(
              'Press the button for jokes:',
              style: Theme.of(context).textTheme.headline,
            ),
            joke,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _generateJoke,
        tooltip: 'Get joke',
        child: Icon(Icons.chat_bubble),
      ),
    );
  }
}
