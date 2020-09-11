import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String id;
  DatabaseService({this.id});
  final CollectionReference itemCollection =
      Firestore.instance.collection('Items');

  Future updateItemData(String itemNo, String itemName, String expiryDate,
      String remaining, String availability) async {
    return await itemCollection.document(id).setData({
      'itemNo': itemNo,
      'itemName': itemName,
      'expiryDate': expiryDate,
      'remaining': remaining,
      'availability': availability,
    });
  }
}
