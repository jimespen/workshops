import 'package:flutter/material.dart';
import 'package:navigation/page_models/list_item.dart';
import 'package:navigation/pages/detail_page.dart';

class ListPage extends StatelessWidget {
  final String title;
  final items = [
    ListItem("Item 1", Icon(Icons.ac_unit), "An AC unit."),
    ListItem("Item 2", Icon(Icons.backspace), "Backspace."),
    ListItem("Item 3", Icon(Icons.cake), "Le gateaux c'est faux."),
    ListItem("Item 4", Icon(Icons.dashboard), "I Made Dis."),
    ListItem("Item 5", Icon(Icons.email), "You've got spam.")
  ];

  ListPage({Key key, this.title}) : super(key: key);

  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(title)),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            var item = items[index];
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
        // can also use a map for static lists
        // children: items
        // .map((item) => ListTile(
        //       title: Text(item.title),
        //       leading: item.icon,
        //       onTap: () {
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) => DetailPage(listItem: item)));
        //       },
        //     ).toList()),
      );
}
