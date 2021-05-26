import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  String _qrResult = "----------------------";

  _scan() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#5dc9b6", "Cancel", true, ScanMode.QR)
        .then((value) => setState(() => _qrResult = value));
  }

  // ignore: non_constant_identifier_names
  _launchUrl(String Url) async {
    if (await canLaunch(Url)) {
      await launch(Url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan QR CODE"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "RESULT",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            InkWell(
              child: Text(
                _qrResult,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0, color: Colors.teal),
              ),
              onTap: () => _launchUrl(_qrResult),
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              padding: EdgeInsets.all(15.0),
              child: Text("SCAN QR CODE"),
              onPressed: () => _scan(),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: Colors.blue, width: 3.0)),
            )
          ],
        ),
      ),
    );
  }
}
