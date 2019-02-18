import 'package:flutter/material.dart';
import 'package:navigation/pages/list_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final title = 'Basic List w/ navigation';

    return MaterialApp(
      title: title,
      home: ListPage(
        title: title,
      ),
    );
  }
}
