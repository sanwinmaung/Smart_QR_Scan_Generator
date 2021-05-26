import 'package:flutter/material.dart';
import 'package:qr_code/barcode.dart';
import 'package:qr_code/generate.dart';
import 'package:qr_code/scan.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan & Generate"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset("assets/images/icon.png"),
            SizedBox(height: 40.0),
            flatButton("Scan Barcode", Barcode()),
            SizedBox(height: 10.0),
            flatButton("Scan QR CODE", Scan()),
            SizedBox(height: 10.0),
            flatButton("Generate QR CODE", Generate()),
          ],
        ),
      ),
    );;
  }

  Widget flatButton(String text, Widget widget) {
    return FlatButton(
      padding: EdgeInsets.all(15.0),
      child: Text(text),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget));
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0), side: BorderSide(color: Colors.blue, width: 3.0)),
    );
  }
}
