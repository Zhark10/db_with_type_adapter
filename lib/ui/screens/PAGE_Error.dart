import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  ErrorPage({Key key, this.error}) : super(key: key);

  final String error;

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.error),
      ),
      body: Center(
          child: Text(widget.error,
              style: TextStyle(
                color: Colors.red,
                fontSize: 24.0,
              ))),
    );
  }
}
