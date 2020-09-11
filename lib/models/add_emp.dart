import 'package:flutter/material.dart';
import 'package:viola_admin/constants.dart';
import 'package:viola_admin/inventory/inventory.dart';
import 'package:viola_admin/models/appBar.dart';

class AddEmp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text("Admin Side", style: TextStyle(fontSize: 40)),
              decoration: BoxDecoration(
                color: PrimaryColor,
              ),
            ),
            ListTile(
              title: Text("Manage Inventory"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Inventory()));
              },
            ),
          ],
        ),
      ),
      appBar: AdminAppBar(title: "Add Employee"),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 40.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Full Name'),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'NIC'),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Home Address'),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Telephone'),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Date Of Birth'),
                ),
                SizedBox(height: 30.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      FlatButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_a_photo,
                          color: Colors.grey[600],
                        ),
                        label: Text(
                          "Upload a Photo",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 30.0,
                ),
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.save),
                  label: Text('Add Employee'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
