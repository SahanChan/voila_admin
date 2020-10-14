// class Inventory extends StatefulWidget {
//   @override
//   _InventoryState createState() => _InventoryState();
// }

// class _InventoryState extends State<Inventory> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AdminAppBar(title: "Inventory"),
//       backgroundColor: BackgroundColor,
//       body: Container(
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(20.0, 20, 25, 0),
//           child: Column(
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Container(
//                       child: Column(
//                         children: <Widget>[],
//                       ),
//                     ),
//                     Container(
//                       child: FlatButton(
//                         child: Row(
//                           children: <Widget>[
//                             Icon(Icons.add),
//                             Text("Add New Item"),
//                           ],
//                         ),
//                         color: PrimaryColor,
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => AddNewItem()));
//                         },
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: StreamBuilder(
//                     stream: Firestore.instance.collection('Items').snapshots(),
//                     builder: (context, snapshot) {
//                       if (!snapshot.hasData)
//                         return Text("loading pls wait");
//                       else {
//                         final list = snapshot.data.documents;

//                         return ListView.builder(
//                           itemBuilder: (context, index) {
//                             return Dismissible(
//                               onDismissed: (direction) {
//                                 setState(() async {
//                                   await Firestore.instance
//                                       .collection('Item')
//                                       .document(list[index])
//                                       .delete();
//                                 });
//                               },
//                               key: ValueKey("abc"),
//                               child: Card(
//                                 color: CardColor,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: <Widget>[
//                                         Expanded(
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.stretch,
//                                             children: <Widget>[
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.fromLTRB(
//                                                         8, 8, 8, 2),
//                                                 child: Text(
//                                                   "Item Number: " +
//                                                       list[index]['itemNo'],
//                                                   style: TextStyle(
//                                                       fontSize: 15,
//                                                       fontWeight:
//                                                           FontWeight.bold),
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(8.0),
//                                                 child: Text(
//                                                   "Item Name: " +
//                                                       list[index]['itemName'],
//                                                   style:
//                                                       TextStyle(fontSize: 12),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.fromLTRB(
//                                           8.0, 0, 0, 8),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: <Widget>[
//                                           Padding(
//                                             padding: const EdgeInsets.fromLTRB(
//                                                 0, 0, 10, 0),
//                                             child: Container(
//                                               child: Text(
//                                                 "Expiry Date: " +
//                                                     list[index]['expiryDate']
//                                                         .toString(),
//                                                 style: TextStyle(fontSize: 12),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.fromLTRB(
//                                           8.0, 0, 0, 8),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: <Widget>[
//                                           Padding(
//                                             padding: const EdgeInsets.fromLTRB(
//                                                 0, 0, 10, 0),
//                                             child: Container(
//                                               child: Text(
//                                                 "Availability: " +
//                                                     list[index]['availability']
//                                                         .toString(),
//                                                 style: TextStyle(fontSize: 12),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.fromLTRB(
//                                           8.0, 0, 0, 8),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: <Widget>[
//                                           Padding(
//                                             padding: const EdgeInsets.fromLTRB(
//                                                 0, 0, 10, 0),
//                                             child: Container(
//                                               child: Text(
//                                                 "Remaining: " +
//                                                     list[index]['remaining']
//                                                         .toString(),
//                                                 style: TextStyle(fontSize: 12),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                           itemCount: list.length,
//                         );
//                       }
//                     }),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
