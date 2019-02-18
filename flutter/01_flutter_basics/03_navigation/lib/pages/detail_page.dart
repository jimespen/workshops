import 'package:flutter/material.dart';
import 'package:navigation/page_models/list_item.dart';

class DetailPage extends StatelessWidget {
  final ListItem listItem;

  const DetailPage({Key key, @required this.listItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(listItem.title),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Icon(
                listItem.iconData,
                size: 100,
              ),
              Text(
                listItem.description,
                textScaleFactor: 2.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
