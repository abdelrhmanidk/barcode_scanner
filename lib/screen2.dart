import 'package:flutter/material.dart';
import 'package:scan2/main.dart';

class screen2 extends StatelessWidget {
  const screen2({super.key});
//get _scanBarcode => null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text('Alternatives'),
              const SizedBox(
                height: 30,
              ),
              TextButton(onPressed: () {}, child: const Text('Scan Again'))
            ],
          ),
        ));
  }
}
