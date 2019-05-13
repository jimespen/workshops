import 'package:flutter/material.dart';
import 'package:navigation/page_models/list_item.dart';
import 'package:navigation/pages/detail_page.dart';

class ListPage extends StatelessWidget {
  final String title;
  final items = [
    ListItem("Item 1", Icons.ac_unit, "An AC unit."),
    ListItem("Item 2", Icons.backspace, "Backspace."),
    ListItem("Item 3", Icons.cake, "Le gateaux c'est faux."),
    ListItem("Item 4", Icons.dashboard, "I Made Dis."),
    ListItem("Item 5", Icons.email, "You've got spam.")
  ];

  ListPage({Key key, this.title}) : super(key: key);

  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(title)),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            var item = items[index];
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                  color: (index % 2 == 0)
                      ? Colors.lightBlueAccent
                      : Colors.greenAccent,
                  border: Border.fromBorderSide(BorderSide()),
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(55), right: Radius.circular(55))),
              child: ListTile(
                title: Text(item.title),
                leading: Icon(item.iconData),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(listItem: item)));
                },
              ),
            );
          },
        ),
        // can also use a map for static lists
        // body: ListView(
        //     children: items
        //         .map((item) => ListTile(
        //               title: Text(item.title),
        //               leading: Icon(item.iconData),
        //               onTap: () {
        //                 Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                         builder: (context) =>
        //                             DetailPage(listItem: item)));
        //               },
        //             ))
        //         .toList()),
      );
}
