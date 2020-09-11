import 'package:cloud_firestore/cloud_firestore.dart';
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
    final _formKey = GlobalKey<FormState>();

    final itemNo = TextEditingController();
    final itemName = TextEditingController();

    final availability = TextEditingController();
    final expiryDate = TextEditingController();
    final remaining = TextEditingController();

    return Scaffold(
      appBar: AdminAppBar(
        title: "Add new Item",
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 40.0),
                TextFormField(
                  controller: itemNo,
                  decoration: InputDecoration(labelText: 'Item no'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter item no";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: itemName,
                  decoration: InputDecoration(labelText: 'Item name'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter item name";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: availability,
                  decoration: InputDecoration(labelText: 'Availability'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "enterif avalaible or out of stock";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: expiryDate,
                  decoration: InputDecoration(labelText: 'Expiry date'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter expiry date";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: remaining,
                  decoration: InputDecoration(labelText: 'Remaining'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter remaining amount";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 30.0),
                FlatButton(
                  onPressed: () {
                    if (itemNo.text.isNotEmpty &&
                        itemName.text.isNotEmpty &&
                        availability.text.isNotEmpty) {
                      Firestore.instance.collection('Items').add({
                        'itemNo': itemNo.text,
                        'itemName': itemName.text,
                        'expiryDate': expiryDate.text,
                        'remaining': remaining.text,
                        'availability': availability.text,
                      }).then((_) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Successfully Added')));
                        itemNo.clear();
                        itemNo.clear();
                        expiryDate.clear();
                        remaining.clear();
                        availability.clear();
                      });
                    }
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
