import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:scan2/screen2.dart';
import 'package:scan2/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barcode Scanner',
      home: BarcodeScannerApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BarcodeScannerApp extends StatefulWidget {
  @override
  _BarcodeScannerAppState createState() => _BarcodeScannerAppState();
}

class _BarcodeScannerAppState extends State<BarcodeScannerApp> {
  String _barcodeResult = "Where is the future is built pixel by pixel";

  Future<void> _scanBarcode() async {
    String barcodeScanResult = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", true, ScanMode.BARCODE);

    if (!mounted) return;

    setState(() {
      _barcodeResult = barcodeScanResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  title: const Text('Barcode Scanner'),
      //  backgroundColor: Color.fromARGB(255, 154, 126, 41),
      //),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('lib/assests/1.jpg'),
              Text(
                _barcodeResult,
                style:
                    const TextStyle(fontSize: 16.0, color: Colors.yellowAccent),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton.icon(
                //onPressed: _scanBarcode,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text('Scan Barcode'),
                //onPressed: _scanBarcode.map(screen2()),
                onPressed: () {
                  //Navigate to the new screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => screen2()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
