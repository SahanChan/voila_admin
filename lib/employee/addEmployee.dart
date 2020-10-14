import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:viola_admin/constants.dart';
import 'package:viola_admin/models/appBar.dart';

class AddNewEmployee extends StatefulWidget {
  @override
  _AddNewEmployeeState createState() => _AddNewEmployeeState();
}

class _AddNewEmployeeState extends State<AddNewEmployee> {
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

    final name = TextEditingController();
    final email = TextEditingController();
    final dob = TextEditingController();
    final nic = TextEditingController();
    final homeAddress = TextEditingController();
    final telephone = TextEditingController();

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
                  controller: name,
                  decoration:
                      InputDecoration(labelText: 'Name', hintText: "Full Name"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter your name please";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                      labelText: 'Email', hintText: "Email Address"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter email address  please";
                    }
                    if (EmailValidator.validate(value)) {
                      return null;
                    } else {
                      return "Please enter a valid email Address";
                    }
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: dob,
                  decoration: InputDecoration(
                      labelText: 'Date of Birth', hintText: "DD/MM/YYYY"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "enter date of birth please";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: nic,
                  decoration:
                      InputDecoration(labelText: 'NIC', hintText: "NIC number"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter National ID please";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: homeAddress,
                  decoration: InputDecoration(
                      labelText: 'Address', hintText: "Home address"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter home address please";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: telephone,
                  decoration: InputDecoration(
                      labelText: 'Telephone', hintText: "Telephone number"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter telphone number please";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 30.0),
                FlatButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Firestore.instance.collection('Employees').add({
                        'name': name.text,
                        'email': email.text,
                        'dob': dob.text,
                        'homeAddress': homeAddress.text,
                        'telephone': telephone.text,
                        'nic': nic.text,
                      });
                    }
                    // Navigator.of(context).pop();
                  },
                  child: Text('Add Employee to database'),
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
