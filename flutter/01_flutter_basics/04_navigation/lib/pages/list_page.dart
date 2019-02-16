import 'package:flutter/material.dart';
import 'package:navigation/page_models/list_item.dart';
import 'package:navigation/pages/detail_page.dart';

class ListPage extends StatefulWidget {
  List<ListItem> items;
  final String title;

  ListPage({Key key, @required this.items, this.title}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    widget.items = [
      ListItem("Item 1", Icon(Icons.ac_unit), "An AC unit."),
      ListItem("Item 2", Icon(Icons.backspace), "Backspace."),
      ListItem("Item 3", Icon(Icons.cake), "Le gateaux c'est faux."),
      ListItem("Item 4", Icon(Icons.dashboard), "I Made Dis."),
      ListItem("Item 5", Icon(Icons.email), "You've got spam.")
    ];

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          var item = widget.items[index];
          return ListTile(
            title: Text(item.title),
            leading: item.icon,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(listItem: item)));
            },
          );
        },
      ),
    );
  }
}
