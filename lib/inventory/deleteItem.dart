import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:viola_admin/constants.dart';
import 'package:viola_admin/models/appBar.dart';

class DeleteItem extends StatefulWidget {
  @override
  _DeleteItemState createState() => _DeleteItemState();
}

class _DeleteItemState extends State<DeleteItem> {
  String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBar(title: "Delete Item"),
      body: Container(
        child: StreamBuilder(
            stream: Firestore.instance.collection('Items').snapshots(),
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
                              .collection('Items')
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
                                        child: Text(
                                          list[index]['title'],
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          list[index]['desc'],
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          list[index]['price'].toString(),
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                          onPressed: () async {
                                            DocumentSnapshot ref = list[index];

                                            await Firestore.instance
                                                .collection("Items")
                                                .document(ref.documentID)
                                                .delete();

                                            setState(() {
                                              id = null;
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ],
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
