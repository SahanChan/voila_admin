import 'package:flutter/material.dart';
import 'package:viola_admin/constants.dart';
import 'package:viola_admin/employee/addEmployee.dart';
import 'package:viola_admin/employee/deleteEmployee.dart';
import 'package:viola_admin/models/appBar.dart';

class Employees extends StatefulWidget {
  @override
  _EmployeesState createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BackgroundColor,
        appBar: AdminAppBar(title: "Employees"),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text("Add Employee", style: TextStyle(fontSize: 30)),
                color: PrimaryColor,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddNewEmployee()));
                },
              ),
              FlatButton(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text("Delete Employee", style: TextStyle(fontSize: 30)),
                color: PrimaryColor,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DeleteEmployee()));
                },
              ),
              FlatButton(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text("Update Employee", style: TextStyle(fontSize: 30)),
                color: PrimaryColor,
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}
