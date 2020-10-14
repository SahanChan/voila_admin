import 'package:flutter/material.dart';
import 'package:viola_admin/constants.dart';
import 'package:viola_admin/inventory/deleteItem.dart';
import 'package:viola_admin/models/appBar.dart';
import 'package:viola_admin/inventory/addItem.dart';

class Inventory extends StatefulWidget {
  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BackgroundColor,
        appBar: AdminAppBar(title: "Inventory"),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child:
                    Text("Add Inventory item", style: TextStyle(fontSize: 30)),
                color: PrimaryColor,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddNewItem()));
                },
              ),
              FlatButton(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text("Delete Inventory item",
                    style: TextStyle(fontSize: 30)),
                color: PrimaryColor,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DeleteItem()));
                },
              ),
              FlatButton(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text("Update Inventory item",
                    style: TextStyle(fontSize: 30)),
                color: PrimaryColor,
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}
