import 'package:flutter/material.dart';
import 'package:viola_admin/constants.dart';
import 'package:viola_admin/models/appBar.dart';

class AddNewItem extends StatefulWidget {
  @override
  _AddNewItemState createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBar(
        title: "Add new Item",
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 40.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Item no'),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Item name'),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Availability'),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Expiry date'),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Remaining'),
                ),
                SizedBox(height: 30.0),
                FlatButton(
                  onPressed: () {
                    updateItemData();
                  },
                  child: Text('Add Item to Inventory'),
                  color: PrimaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: BackgroundColor,
    );
  }
}
