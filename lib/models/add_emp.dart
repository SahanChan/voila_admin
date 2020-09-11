// import 'dart:html';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:viola_admin/Delivery/delivery.dart';
import 'package:viola_admin/constants.dart';
import 'package:viola_admin/inventory/inventory.dart';
import 'package:viola_admin/models/appBar.dart';

class AddEmp extends StatefulWidget {
  @override
  _AddEmpState createState() => _AddEmpState();
}

class _AddEmpState extends State<AddEmp> {
  final _formKey = GlobalKey<FormState>();

  final fullName = TextEditingController();
  final nic = TextEditingController();

  final email = TextEditingController();
  final homeAddress = TextEditingController();
  final telephone = TextEditingController();
  final dateOfBirth = TextEditingController();
  // final dbRef = FirebaseDatabase.instance.reference().child("Employees");

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
            ListTile(
              title: Text("Delivery Management"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
            ),
          ],
        ),
      ),
      appBar: AdminAppBar(title: "Add Employee"),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 40.0),
                TextFormField(
                  controller: fullName,
                  decoration: InputDecoration(labelText: 'Full Name'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter Full Name";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: nic,
                  decoration: InputDecoration(labelText: 'NIC'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter NIC";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter Email";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: homeAddress,
                  decoration: InputDecoration(labelText: 'Home Address'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter Home Address";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: telephone,
                  decoration: InputDecoration(labelText: 'Telephone'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter Telephone";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: dateOfBirth,
                  decoration: InputDecoration(labelText: 'Date Of Birth'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter Date of Birth";
                    } else {
                      return null;
                    }
                  },
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
                  onPressed: () {
                    if (fullName.text.isNotEmpty &&
                        nic.text.isNotEmpty &&
                        homeAddress.text.isNotEmpty) {
                      Firestore.instance.collection('Employees').add({
                        'fullName': fullName.text,
                        'NIC': nic.text,
                        'email': email.text,
                        'homeAddress': homeAddress.text,
                        'telephone': telephone.text,
                        'dateOfBirth': dateOfBirth.text,
                      }).then((_) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Successfully Added')));
                        fullName.clear();
                        nic.clear();
                        email.clear();
                        homeAddress.clear();
                        telephone.clear();
                        dateOfBirth.clear();
                      }).then((result) => {
                            Navigator.pop(context),
                            fullName.clear(),
                            nic.clear(),
                            email.clear(),
                            homeAddress.clear(),
                            telephone.clear(),
                            dateOfBirth.clear(),
                          });
                    }
                  },
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
