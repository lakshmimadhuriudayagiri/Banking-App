// lib/screens/scan_screen.dart
import 'package:flutter/material.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan QR')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.qr_code_scanner, size: 100, color: Colors.purple),
            SizedBox(height: 16),
            Text('Point camera to QR code', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}