import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:viola_admin/constants.dart';
import 'package:viola_admin/models/appBar.dart';

class AddNewItem extends StatefulWidget {
  @override
  _AddNewItemState createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  // File _imageFile;
  // final picker = ImagePicker();

  // Future pickImage() async {
  //   final pickedFile = await picker.getImage(source: ImageSource.gallery);
  //   setState(() {
  //     _imageFile = File(pickedFile.path);
  //   });
  // }

  // Future uploadImageToFirebase(BuildContext context) async{
  //   String filename = basename(_imageFile.path);
  //   StorageReference firebaseStorageRef = FirebaseStorage.instance

  // }

  // uploadImage() {
  //   //check permission

  //   //select image

  //   //upload to firebase
  // }
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final title = TextEditingController();
    final desc = TextEditingController();

    final price = TextEditingController();
    final expiryDate = TextEditingController();

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
                  controller: title,
                  decoration: InputDecoration(
                      labelText: 'Title', hintText: "Item Name"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter title please";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: desc,
                  decoration: InputDecoration(
                      labelText: 'Item Description', hintText: "Lorem ipsum"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter description please";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: price,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Price', hintText: "Price of 1 item"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "enter price please";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: expiryDate,
                  decoration: InputDecoration(
                      labelText: 'Expiry date', hintText: "DD/MM/YYYY"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter expiry date please";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10.0),

                FlatButton(
                  color: PrimaryColor,
                  onPressed: () {
                    print("pressed");
                  },
                  child: Text("Upload Image"),
                ),
                // TextFormField(
                //   controller: remaining,
                //   decoration: InputDecoration(labelText: 'Remaining'),
                //   validator: (value) {
                //     if (value.isEmpty) {
                //       return "Enter remaining amount";
                //     } else {
                //       return null;
                //     }
                //   },
                // ),
                SizedBox(height: 30.0),
                FlatButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Firestore.instance.collection('Items').add({
                        'title': title.text,
                        'desc': desc.text,
                        'price': int.parse(price.text),
                        'expiryDate': expiryDate.text,
                        'imageUrl': null,
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
