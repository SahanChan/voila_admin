import 'package:flutter/material.dart';
import 'package:viola_admin/constants.dart';
import 'package:viola_admin/models/appBar.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBar(title: "Orders"),
      backgroundColor: BackgroundColor,
    );
  }
}
