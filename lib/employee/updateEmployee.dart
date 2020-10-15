import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:viola_admin/constants.dart';
import 'package:viola_admin/models/appBar.dart';

class UpdateEmployee extends StatefulWidget {
  @override
  _UpdateEmployeeState createState() => _UpdateEmployeeState();
}

class _UpdateEmployeeState extends State<UpdateEmployee> {
  String id;

  final name = TextEditingController();
  final email = TextEditingController();
  final dob = TextEditingController();
  final nic = TextEditingController();
  final homeAddress = TextEditingController();
  final telephone = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBar(title: "Update Employee"),
      body: Container(
        child: StreamBuilder(
            stream: Firestore.instance.collection('Employees').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Text("loading pls wait");
              else {
                final list = snapshot.data.documents;

                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Dismissible(
                      onDismissed: (direction) {
                        setState(() {
                          print("dissmisible");
                        });
                      },
                      key: ValueKey("abc"),
                      child: Card(
                        color: CardColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 8, 8, 2),
                                        child: Center(
                                          child: Text(
                                            "Name: " + list[index]['name'],
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(
                                            "NIC Number: " + list[index]['nic'],
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(
                                            "Telephone number: " +
                                                list[index]['telephone'],
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SingleChildScrollView(
                                            child: AlertDialog(
                                              title: Text("Update Employee"),
                                              content: Form(
                                                key: _formKey,
                                                child: Column(
                                                  children: [
                                                    TextFormField(
                                                      controller: name,
                                                      validator: (value) {
                                                        if (value.isEmpty) {
                                                          return "Enter your name please";
                                                        } else {
                                                          return null;
                                                        }
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                              labelText:
                                                                  "Name"),
                                                    ),
                                                    TextFormField(
                                                      controller: email,
                                                      decoration:
                                                          InputDecoration(
                                                              labelText:
                                                                  "Email"),
                                                      validator: (value) {
                                                        if (value.isEmpty) {
                                                          return "Enter email address  please";
                                                        }
                                                        if (EmailValidator
                                                            .validate(value)) {
                                                          return null;
                                                        } else {
                                                          return "Please enter a valid email Address";
                                                        }
                                                      },
                                                    ),
                                                    TextFormField(
                                                      controller: dob,
                                                      decoration: InputDecoration(
                                                          labelText:
                                                              "Date of Birth"),
                                                      validator: (value) {
                                                        if (value.isEmpty) {
                                                          return "enter date of birth please";
                                                        } else {
                                                          return null;
                                                        }
                                                      },
                                                    ),
                                                    TextFormField(
                                                      controller: nic,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          InputDecoration(
                                                              labelText:
                                                                  "NIC number"),
                                                      validator: (value) {
                                                        if (value.isEmpty) {
                                                          return "Enter National ID please";
                                                        } else {
                                                          return null;
                                                        }
                                                      },
                                                    ),
                                                    TextFormField(
                                                      controller: homeAddress,
                                                      decoration: InputDecoration(
                                                          labelText:
                                                              "Home Address"),
                                                      validator: (value) {
                                                        if (value.isEmpty) {
                                                          return "Enter home address please";
                                                        } else {
                                                          return null;
                                                        }
                                                      },
                                                    ),
                                                    TextFormField(
                                                      controller: telephone,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          InputDecoration(
                                                              labelText:
                                                                  "Telephone"),
                                                      validator: (value) {
                                                        if (value.isEmpty) {
                                                          return "Enter telphone number please";
                                                        } else {
                                                          return null;
                                                        }
                                                      },
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10),
                                                      child: FlatButton(
                                                          color: PrimaryColor,
                                                          onPressed: () async {
                                                            if (_formKey
                                                                .currentState
                                                                .validate()) {
                                                              DocumentSnapshot
                                                                  ref =
                                                                  list[index];

                                                              await Firestore
                                                                  .instance
                                                                  .collection(
                                                                      "Employees")
                                                                  .document(ref
                                                                      .documentID)
                                                                  .updateData({
                                                                'name':
                                                                    name.text,
                                                                'email':
                                                                    email.text,
                                                                'homeAddress':
                                                                    homeAddress
                                                                        .text,
                                                                'dob': dob.text,
                                                                'nic': nic.text,
                                                                'telephone':
                                                                    telephone
                                                                        .text,
                                                              });

                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            }
                                                          },
                                                          child:
                                                              Text("Update")),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: [
                                                FlatButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("Exit")),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: list.length,
                );
              }
            }),
      ),
    );
  }
}
