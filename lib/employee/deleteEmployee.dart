import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:viola_admin/models/appBar.dart';
import 'package:viola_admin/constants.dart';

class DeleteEmployee extends StatefulWidget {
  @override
  _DeleteEmployeeState createState() => _DeleteEmployeeState();
}

class _DeleteEmployeeState extends State<DeleteEmployee> {
  String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBar(title: "Delete Employee"),
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
                        setState(() async {
                          await Firestore.instance
                              .collection('Employees')
                              .document()
                              .delete();
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
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () async {
                                    DocumentSnapshot ref = list[index];

                                    await Firestore.instance
                                        .collection("Employees")
                                        .document(ref.documentID)
                                        .delete();

                                    setState(() {
                                      id = null;
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
